import React from 'react'


class Form extends React.Component{
    constructor(){
        super()
        this.state={
        }
    }


    render(){
        return(
            <div>
            <button className={this.props.hide_btn} onClick={()=>{this.props.getStarted()}}>BEGIN</button>
            </div>
            )
    }



}



export default Form;