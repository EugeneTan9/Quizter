import React from 'react'
import axios from 'axios';
import Form from './form'

    const quizzes= [{
    "id": 1,
    "user_id": 1,
    "title": "Star Wars Quiz",
    "description": "This is a quiz to test your knowledge of star wars",
    "img_url": "http://www.serebii.net/pokemongo/pokemon/001.png",
    "questions": [{
        "body": "What is a lightsaber?",
        "answer": "weapon",
        "choices": [
            "weapon",
            "banana",
            "apple",
            "orange"
        ]
    }]
},{
    "id": 2,
    "user_id": 1,
    "title": "Pokemon Quiz",
    "description": "Gotta catch them all quiz",
    "img_url": "http://www.serebii.net/pokemongo/pokemon/002.png",
    "questions": [{
        "body": "Who is Ash?",
        "answer": "Pokemon Trainer",
        "choices": [
            "Pokemon Trainer",
            "Chef",
            "Insurance Agent",
            "Tour guide"
        ]
    }]
}]
    let i = -1;



class App extends React.Component{
    constructor(){
        super()
        this.state ={
            question:[],
            choices:[]
        }

        this.getQn = this.getQn.bind(this);
        this.test = this.test.bind(this);
    }

    getQn(){
        i ++;
        this.state.question = quizzes[i].questions[0].body;
        this.setState({question:this.state.question});
        this.state.choices = quizzes[i].questions[0].choices;
        this.setState({choices:this.state.choices});
        console.log(this.state.choices);
    }


    test(){
        const url = '/quizzes.json';

        axios.get(url)
            .then((response) => {
                const data = response.data
                console.log(data)
                this.setState({question: data})
            }).catch((error) =>{
                console.log(error);
            })
    }


    render(){


        const choices = this.state.choices.map((choices, index)=>{
            return(<div>
                <p>{choices}</p>
                </div>
                )
        })

        return(
            <div>

            <Form getQn ={this.getQn} test={this.test}/>
            {this.state.question}
            {choices}
            </div>
            )
    }


}


export default App;