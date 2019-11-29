import React from 'react'
import axios from 'axios';
import Form from './form'

    let qn = 0;



class App extends React.Component{
    constructor(){
        super()
        this.state ={
            question:"",
            choices:[]
        }

        this.getQn = this.getQn.bind(this);
        this.getOption = this.getOption.bind(this);
        this.getAll = this.getAll.bind(this);
    }

    getAll(){
        this.getQn();
        this.getOption();
    }

    getQn(){
        const url = '/questions.json'

        axios.get(url)
            .then((response) => {
                const data = response.data
                const quiz_id = window.location.pathname.split("/")[2];
                console.log(quiz_id)
                const filteredData = data.filter(x=>x.quiz_id == quiz_id)
                console.log(filteredData)
                this.state.question = filteredData[qn];
                console.log(this.state.question);
                this.setState({question:this.state.question});
                qn ++;
            }).catch((error)=>{
                console.log(error);
            })
    }

    getOption(){
        const url = '/options.json'

        axios.get(url)
            .then((response)=>{
                const data = response.data
                const quiz_id = window.location.pathname.split("/")[2];
                const filteredOps = data.filter(x=>x.question_id == qn);
                this.shuffle(filteredOps)
                this.state.choices = filteredOps;
                this.setState({choices:this.state.choices});
            }).catch((error)=>{
                console.log(error);
            })
    }

    shuffle(array) {
      var currentIndex = array.length, temporaryValue, randomIndex;

      // While there remain elements to shuffle...
      while (0 !== currentIndex) {

        // Pick a remaining element...
        randomIndex = Math.floor(Math.random() * currentIndex);
        currentIndex -= 1;

        // And swap it with the current element.
        temporaryValue = array[currentIndex];
        array[currentIndex] = array[randomIndex];
        array[randomIndex] = temporaryValue;
      }

      return array;
    }

    render(){
        console.log(this.state.choices);
        const choices = this.state.choices.map((choices, index)=>{
            return(<div>
                <p>{choices.choice}</p>
                </div>
                )
        });

        return(
            <div>

            <Form getAll ={this.getAll}/>
            <h3>{this.state.question.body}</h3>
            {choices}
            </div>
            )
    }


}


export default App;