import React from 'react'


class Mapping extends React.Component{
    constructor(){
        super()
        this.state={
        }
    }



    render(){
        const choices = this.props.choices.map((choices, index)=>{
            return(<div key={index}>
                <button className="choiceBtn"onClick={()=>{this.props.saveAnw(event)}}>{choices.body}</button>
                </div>
                )
        });

        return(
            <div className={this.props.card}>
                <div id="countdown"></div>
                <h4 className="qn_num">{this.props.qn_num}</h4>
                <h2>{this.props.question}</h2>
                {choices}
            </div>
            )
    }



}



export default Mapping;