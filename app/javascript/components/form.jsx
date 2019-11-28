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
            working from formmmmmmmmm
            <button onClick={()=>{this.props.getQn()}}>Clickkkkkkk</button>
            </div>
            )
    }



}



export default Form;