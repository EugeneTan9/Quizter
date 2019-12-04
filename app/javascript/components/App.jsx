import React from 'react'
import axios from 'axios';
import Form from './form'
import Results from './results'
import './App.css';
import ProgressMobileStepper from './progressbar'
import Mapping from './mapping'

    // qn number
    let qn = 0;
    let quiz_id = window.location.pathname.split("/")[2];
    // array to store the answers of the user
    const scoreArr = [];
    var timeleft = 10;

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
            card:"hide",
            results_card:"hide",
            score:null,
            badge:[],
            noBadge:"",
            progressBarSteps:null,
            currentProgressBarStep:1,
            progressBarDiv:"progressBarDiv"
        }

        this.getQn = this.getQn.bind(this);
        this.getOption = this.getOption.bind(this);
        this.saveAnw = this.saveAnw.bind(this);
        this.getQuiz = this.getQuiz.bind(this);
        this.getStarted = this.getStarted.bind(this);
        this.getResults = this.getResults.bind(this);
        this.getBadge = this.getBadge.bind(this)
    }

    // start the quiz and hide the start button
    getStarted(){
        this.state.card = "card";
        this.setState({card:this.state.card});
        this.state.hide_btn = "hide";
        console.log(this.state.hide_btn);
        this.setState({hide_btn:this.state.hide_btn});
        this.getQn();
        this.getQuiz();
    }

    // get the number of qn for the quiz
    getQuiz(){
        const url= '/quizzes/' + quiz_id + '/questions.json'

        axios.get(url)
            .then((response)=>{
                const data = response.data
                const length = data.filter(x=>x.quiz_id && x.body_type === "Q")
                console.log(length.length);
                this.state.quiz_length = length.length;
                this.setState({quiz_length:this.state.quiz_length, progressBarSteps:++this.state.quiz_length});
            }).catch((error)=> {
                console.log(error);
            })
    }

    // getting each question of the quiz
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
                this.setInterval()
            }).catch((error)=> {
                console.log(error);
            })
    }

    // getting the choices of the quiz
    getOption(){
        const url= '/quizzes/' + quiz_id + '/questions.json'

        axios.get(url)
            .then((response)=>{
                const data = response.data
                const filteredOps = data.filter(x=>x.quiz_id == quiz_id && x.body_type !== "Q" && x.question_num === qn);
                this.shuffle(filteredOps)
                this.state.choices = filteredOps;
                this.setState({choices:this.state.choices});
                // this.map();
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

    // function to push the answers into scoreArr
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
            this.state.progressBarDiv = "hide";
            this.setState({progressBarDiv:this.state.progressBarDiv});
            this.state.results_card = "results_card";
            this.setState({results_card:this.state.results_card})
        }else{
            // this.state.currentProgressBarStep ++;
            this.setState({currentProgressBarStep:++this.state.currentProgressBarStep});
            this.getQn()
        }
    }



    setInterval(){
        var downloadTimer = setInterval(function(){
          document.getElementById("countdown").innerHTML = timeleft + " seconds remaining";
          timeleft -= 1;
          if(timeleft <= 0){
            clearInterval(downloadTimer);
            document.getElementById("countdown").innerHTML = "Finished"
          }
        }, 1000);
    }


    // calculating the total score of the quiz
    async getResults(){
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
        await this.getBadge();
        await this.saveResults();
    }

    // inserting the results into the results table
    async saveResults(){
        const url = '/results'
        let data = {};
        data.quiz_id = quiz_id;
        data.quiz_result = this.state.score;

        return axios.post(url, data)
        .then((response)=>{
            console.log("WWWWOOOOOOHOOOOOOO")
        }).catch((error)=>{
            console.log(error);
        })
    }

    saveBadge(){
        const url = '/badges_users'
        console.log(this.state.badge.id)
        const data={
            badge_id : this.state.badge.id
        }

        return axios.post(url, data)
            .then((response)=>{
                console.log("working");
            }).catch((error)=>{
                console.log(error);
            })
    }

    // checking whether the user gotten any badge
    async getBadge(){
        const url = '/quizzes/' + quiz_id + '/thebadge.json'
        console.log(url);
        return axios.get(url)
            .then((response)=>{
                const data = response.data
                console.log(data);
                console.log(data.criteria);
                if (this.state.score >= data.criteria) {
                    this.state.badge = data
                    this.setState({badge:this.state.badge});
                    this.saveBadge();
                }
                else{
                    console.log("Sorry no badges this time");
                    this.state.noBadge="Sorry, you didn't get any badge this time. Better luck next time";
                    this.setState({noBadge:this.state.noBadge});
                }


            }).catch((error)=>{
                console.log(error);
            })
    }




    render(){

        return(
            <div>
                <div id="countdown"></div>
                <Form getStarted ={this.getStarted} hide_btn={this.state.hide_btn}/>

                <Results results_card={this.state.results_card} getResults={this.getResults} score={this.state.score} badge={this.state.badge} noBadge={this.state.noBadge}/>
                <Mapping card={this.state.card} qn_num={this.state.qn_num} question={this.state.question} choices={this.state.choices} saveAnw={this.saveAnw}/>
                <div className={this.state.progressBarDiv}>
                    <ProgressMobileStepper steps={this.state.progressBarSteps} currentStep={this.state.currentProgressBarStep}/>
                </div>
            </div>
            )
    }


}


export default App;