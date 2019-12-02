import React from 'react'
import axios from 'axios';
import Form from './form'
import Results from './results'
import './App.css';

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
            answer:"",
            quiz_length:null,
            hide_btn:"button",
            card:"card",
            results_card:"hide",
            score:null,
            badge:[],
            noBadge:""
        }

        this.getQn = this.getQn.bind(this);
        this.getOption = this.getOption.bind(this);
        this.saveAnw = this.saveAnw.bind(this);
        this.getQuiz = this.getQuiz.bind(this);
        this.getStarted = this.getStarted.bind(this);
        this.getResults = this.getResults.bind(this);
        this.getBadge = this.getBadge.bind(this)
    }

    getStarted(){
        this.state.hide_btn = "hide";
        console.log(this.state.hide_btn);
        this.setState({hide_btn:this.state.hide_btn});
        this.getQn();
        this.getQuiz();
    }
    getQuiz(){
        const url= '/quizzes/' + quiz_id + '/questions.json'

        axios.get(url)
            .then((response)=>{
                const data = response.data
                const length = data.filter(x=>x.quiz_id && x.body_type === "Q")
                console.log(length.length);
                this.state.quiz_length = length.length;
                this.setState({quiz_length:this.state.quiz_length});
            }).catch((error)=> {
                console.log(error);
            })
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
        // console.log(this.state.quiz_length)
        if(event.target.innerHTML === this.state.answer){
            scoreArr.push(1);
            console.log(scoreArr);
        }else{
            scoreArr.push(0);
            console.log(scoreArr);
        }
        if(scoreArr.length === this.state.quiz_length){
            console.log("END");
            this.state.card = "hide";
            this.setState({card:this.state.card});
            this.state.results_card = "results_card";
            this.setState({results_card:this.state.results_card})
        }else{
        this.getQn()
        }
    }

    getResults(){
        console.log(scoreArr);
        console.log(scoreArr.length);
        let correct = 0;
        for(var i=0; i<scoreArr.length;  i++){
            if(scoreArr[i] === 1){
                correct++;
            }
        }

        correct = (correct / scoreArr.length) * 100;
        console.log(correct);
        this.state.score = correct;
        this.setState({score:this.state.score});
        this.getBadge();
    }

    getBadge(){
        const url = '/badges.json'

        axios.get(url)
            .then((response)=>{
                const data = response.data
                const filteredBadges = data.filter(x=>x.quiz_id == quiz_id);
                console.log(filteredBadges[1].criteria)
                for(var i=0; i < filteredBadges.length; i ++){
                    if (this.state.score >= filteredBadges[i].criteria) {
                        this.state.badge = filteredBadges[i];
                        console.log(this.state.badge.img_url);
                        this.setState({badge:this.state.badge});
                    }else{
                        console.log("Sorry no badges this time");
                        this.state.noBadge="Sorry, you didn't get any badge this time. Better luck next time";
                        this.setState({noBadge:this.state.noBadge});
                    }
                }
            }).catch((error)=>{
                console.log(error);
            })
    }
    render(){
        const choices = this.state.choices.map((choices, index)=>{
            return(<div key={index}>
                <button onClick={()=>{this.saveAnw(event)}}>{choices.body}</button>
                </div>
                )
        });

        return(
            <div>
                <Results results_card={this.state.results_card} getResults={this.getResults} score={this.state.score} badge={this.state.badge} noBadge={this.state.noBadge}/>
                <div className={this.state.card}>
                    <Form getStarted ={this.getStarted} hide_btn={this.state.hide_btn}/>
                    <h4 className="qn_num">{this.state.qn_num}</h4>
                    <h2>{this.state.question}</h2>
                    {choices}
                </div>
            </div>
            )
    }


}


export default App;