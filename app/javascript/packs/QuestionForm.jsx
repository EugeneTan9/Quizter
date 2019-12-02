import React from 'react';
import ReactDOM from 'react-dom';
import PropTypes from 'prop-types';
import axios from 'axios';

class NewQuestion extends React.Component{
    constructor(){
        super()
        this.state = {
            form: []
        }
    }

//     getStarted(){
//         this.state.hide_btn = "hide";
//         console.log(this.state.hide_btn);
//         this.setState({hide_btn:this.state.hide_btn});
//         this.getQn();
//         this.getQuiz();
//     }

//     getQuiz(){
//         const url= '/quizzes/' + quiz_id + '/questions.json'

//         axios.get(url)
//             .then((response)=>{
//                 const data = response.data
//                 const length = data.filter(x=>x.quiz_id && x.body_type === "Q")
//                 console.log(length.length);
//                 this.state.quiz_length = length.length;
//                 this.setState({quiz_length:this.state.quiz_length});
//             }).catch((error)=> {
//                 console.log(error);
//             })
//     }

//     getQn(){
//         const url= '/quizzes/' + quiz_id + '/questions.json'

//         axios.get(url)
//             .then((response) => {
//                 qn ++;
//                 const data = response.data
//                 const filteredData = data.filter(x=>x.quiz_id == quiz_id && x.body_type === "Q" && x.question_num === qn)
//                 const answer = data.filter(x=>x.quiz_id == quiz_id && x.body_type === "C" && x.question_num === qn)
//                 this.state.answer = answer[0].body;
//                 this.setState({answer:this.state.answer});
//                 this.state.question = filteredData[0].body;
//                 this.setState({question:this.state.question})
//                 this.state.qn_num = qn;
//                 this.setState({qn_num:this.state.qn_num});
//                 this.getOption()
//             }).catch((error)=> {
//                 console.log(error);
//             })
//     }

//     getOption(){
//         const url= '/quizzes/' + quiz_id + '/questions.json'

//         axios.get(url)
//             .then((response)=>{
//                 const data = response.data
//                 const filteredOps = data.filter(x=>x.quiz_id == quiz_id && x.body_type !== "Q" && x.question_num === qn);
//                 this.shuffle(filteredOps)
//                 this.state.choices = filteredOps;
//                 this.setState({choices:this.state.choices});
//             }).catch((error)=>{
//                 console.log(error);
//             })
//     }


// // shuffling the options in an array so that it can be mapped in random sequence
//     shuffle(array) {
//       var currentIndex = array.length, temporaryValue, randomIndex;

//       // While there remain elements to shuffle...
//       while (0 !== currentIndex) {

//         // Pick a remaining element...
//         randomIndex = Math.floor(Math.random() * currentIndex);
//         currentIndex -= 1;

//         // And swap it with the current element.
//         temporaryValue = array[currentIndex];
//         array[currentIndex] = array[randomIndex];
//         array[randomIndex] = temporaryValue;
//       }

//       return array;
//     }

//     saveAnw(){
//         // console.log(this.state.quiz_length)
//         if(event.target.innerHTML === this.state.answer){
//             scoreArr.push(1);
//             console.log(scoreArr);
//         }else{
//             scoreArr.push(0);
//             console.log(scoreArr);
//         }
//         if(scoreArr.length === this.state.quiz_length){
//             console.log("END");
//             this.state.card = "hide";
//             this.setState({card:this.state.card});
//             this.state.results_card = "results_card";
//             this.setState({results_card:this.state.results_card})
//         }else{
//         this.getQn()
//         }
//     }

    render(){
       // console.log(this.state.choices);
        // const choices = this.state.choices.map((choices, index)=>{
        //     return(<div key={index}>
        //         <button onClick={()=>{this.saveAnw(event)}}>{choices.body}</button>
        //         </div>
        //         )
        // });

        return(<div className="d-flex justify-content-center">
            <div className="col-4">
                <h1>New Question</h1>
                    <div class="m-3">
                        <label>Question</label>
                        <textarea class="form-control" placeholder="Required example textarea" required></textarea>
                    </div>
                    <div class="input-group m-3">
                        <label>Option 1 </label>
                        <input type="text" class="form-control" required/>
                    </div>
                    <div class="input-group m-3">
                        <label>Option 2 </label>
                        <input type="text" class="form-control" required/>
                    </div>
                    <div class="input-group m-3">
                        <label>Option 3 </label>
                        <input type="text" class="form-control" required/>
                    </div>
                    <div class="input-group m-3">
                        <label>Option 4 </label>
                        <input type="text" class="form-control" required/>
                    </div>
            </div>
        </div>)
    }
}

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <NewQuestion/>,
    document.body.appendChild(document.createElement('div')),
  )
})