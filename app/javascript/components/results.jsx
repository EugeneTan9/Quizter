import React from 'react'

class Results extends React.Component{
    constructor(){
        super()
        this.state={
        }
    }

    render(){
        return(
            <div className={this.props.results_card}>

            <h2 className="score">{this.props.score}/100</h2>
            <h3>{this.props.noBadge}</h3>
            </div>
            )
    }



}



export default Results;