import React from 'react';
import ReactDOM from 'react-dom';
import PropTypes from 'prop-types';
import axios from 'axios';

class NewQuestion extends React.Component{
    constructor(){
        super()
        this.state = {
            form: [{},{},{},{},{}],
            question_num: 1
        }
    }

    async submitQuestions(){
        try {
            await this.state.form.forEach(item => {
                const response = axios.post('/quizzes/'+window.location.pathname.split("/")[2]+'/questions', item);
                console.log(response);
            })
            this.setState({
                form: [{},{},{},{},{}],
                question_num: this.state.question_num + 1
            })
        } catch (error) {
                console.error(error);
        }
    }

    changeState(e,i){
        let newForm = this.state.form;
        let body_type = ["Q","C","F","F","F"]
        newForm[i] = {question_num: this.state.question_num, body: e.target.value, body_type: body_type[i]}
        this.setState({form: newForm})
        console.log(this.state.form)
    }

    render(){
        return(<div className="d-flex justify-content-center">
            <div className="col-4 m-5">
                <h1>Question #{this.state.question_num}</h1>
                <h4>Question</h4>
                <textarea
                    onChange={(e)=>{this.changeState(e,0)}}
                    className="form-control"
                    placeholder="Question here"
                    value={this.state.form[0].body ? this.state.form[0].body : ""}
                    required
                />
                <h4>Correct Answer</h4>
                <input
                    onChange={(e)=>{this.changeState(e,1)}}
                    type="text"
                    className="form-control"
                    placeholder="Correct answer"
                    value={this.state.form[1].body ? this.state.form[1].body : ""}
                    required
                />
                <h4>False option</h4>
                <input
                    onChange={(e)=>{this.changeState(e,2)}}
                    type="text"
                    className="form-control"
                    placeholder="False option"
                    value={this.state.form[2].body ? this.state.form[2].body : ""}
                    required
                />
                <h4>False option</h4>
                <input
                    onChange={(e)=>{this.changeState(e,3)}}
                    type="text"
                    className="form-control"
                    placeholder="False option"
                    value={this.state.form[3].body ? this.state.form[3].body : ""}
                    required
                />
                <h4>False option</h4>
                <input
                    onChange={(e)=>{this.changeState(e,4)}}
                    type="text"
                    className="form-control"
                    placeholder="False option"
                    value={this.state.form[4].body ? this.state.form[4].body : ""}
                    required
                />
                <div className="d-flex justify-content-around my-3">
                    <button onClick={()=>{this.submitQuestions()}} className="btn btn-primary btn-sm">Add Question</button>
                    <a href={'/quizzes/'+window.location.pathname.split("/")[2]}><button className="btn btn-primary btn-sm">Review Quiz</button></a>
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