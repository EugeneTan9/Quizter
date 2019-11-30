import React from 'react'
import axios from 'axios';
import Form from './form'

    let qn = 0;
    let quiz_id = window.location.pathname.split("/")[2];
    const scoreArr = [];
class App extends React.Component{
    constructor(){
        super()
        this.state ={
            question:"",
            choices:[],
            qn_num: null,
            answer:""
        }

        this.getQn = this.getQn.bind(this);
        this.getOption = this.getOption.bind(this);
        this.saveAnw = this.saveAnw.bind(this);
    }

    getQn(){
        const url= '/quizzes/' + quiz_id + '/questions.json'

        axios.get(url)
            .then((response) => {
                qn ++;
                const data = response.data
                const filteredData = data.filter(x=>x.quiz_id == quiz_id && x.body_type === "Q" && x.question_num === qn)
                const answer = data.filter(x=>x.quiz_id == quiz_id && x.body_type === "C" && x.question_num === qn)
                this.state.answer = answer[0].body;
                this.setState({answer:this.state.answer});
                this.state.question = filteredData[0].body;
                this.setState({question:this.state.question})
                this.state.qn_num = qn;
                this.setState({qn_num:this.state.qn_num});
                this.getOption()
            }).catch((error)=> {
                console.log(error);
            })
    }

    getOption(){
        const url= '/quizzes/' + quiz_id + '/questions.json'

        axios.get(url)
            .then((response)=>{
                const data = response.data
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

    saveAnw(){
        console.log(event.target.innerHTML);
        console.log(this.state.answer);
        if(event.target.innerHTML === this.state.answer){
            scoreArr.push(1);
            console.log(scoreArr);
        }else{
            scoreArr.push(0);
            console.log(scoreArr);
        }
        this.getQn()

    }

    render(){
       // console.log(this.state.choices);
        const choices = this.state.choices.map((choices, index)=>{
            return(<div key={index}>
                <button onClick={()=>{this.saveAnw(event)}}>{choices.body}</button>
                </div>
                )
        });

        return(
            <div>
                <div>
                    <Form getQn ={this.getQn}/>
                    <h4>{this.state.qn_num}</h4>
                    <h2>{this.state.question}</h2>
                    {choices}
                </div>
            </div>
            )
    }


}


export default App;