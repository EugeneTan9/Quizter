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
            <button onClick={()=>{this.props.getQn()}}>Clickkkkkkk</button>
            <button onClick={()=>{this.props.test()}}>Testing</button>
            </div>
            )
    }



}



export default Form;