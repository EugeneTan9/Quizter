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
            <button onClick={()=>{this.props.getAll()}}>Clickkkkkkk</button>
            </div>
            )
    }



}



export default Form;