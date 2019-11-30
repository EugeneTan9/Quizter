import React from 'react'
import axios from 'axios';
import Form from './form'

    let qn = 0;

class App extends React.Component{
    constructor(){
        super()
        this.state ={
            question:"",
            choices:[],
            qn_num: null,

        }

        this.getQn = this.getQn.bind(this);
        this.getOption = this.getOption.bind(this);
        this.getAll = this.getAll.bind(this);
    }

    getAll(){
        this.getQn();
        this.getOption();
    }

// getting the quiz qn
    getQn(){
        // const url = '/quizzes/'+quiz_id+'/questions.json'
        const url = '/questions.json'
        axios.get(url)
            .then((response) => {
                const data = response.data
                const quiz_id = window.location.pathname.split("/")[2];
                const filteredData = data.filter(x=>x.quiz_id == quiz_id)
                this.state.question = filteredData[qn];
                // console.log(this.state.question);
                this.setState({question:this.state.question});
                qn ++;
                this.state.qn_num = qn;
                this.setState({qn_num:this.state.qn_num});
            }).catch((error)=>{
                console.log(error);
            })
    }

// getting the options to the question
    getOption(){
        const url = '/questions.json'

        axios.get(url)
            .then((response)=>{
                const data = response.data
                const quiz_id = window.location.pathname.split("/")[2];
                const filteredOps = data.filter(x=>x.quiz_id == quiz_id && x.body_type !== "Q" && x.question_num === qn);
                this.shuffle(filteredOps)
                this.state.choices = filteredOps;
                this.setState({choices:this.state.choices});
            }).catch((error)=>{
                console.log(error);
            })
    }

// shuffling the options in an array so that it can be mapped in random sequence
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

    question(){
        this.getAll()

    }

    render(){
        console.log(this.state.choices);
        const choices = this.state.choices.map((choices, index)=>{
            return(<div key={index}>
                <button onClick={()=>{this.question()}}>{choices.choice}</button>
                </div>
                )
        });

        return(
            <div>
            {this.state.qn_num}
            <Form getAll ={this.getAll}/>
            <h3>{this.state.question.body}</h3>
            {choices}
            </div>
            )
    }


}


export default App;