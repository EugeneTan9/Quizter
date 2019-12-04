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
            <h2>Well Done completing the quiz!</h2>

            <h2>{this.props.score}</h2>

            <h3>{this.props.noBadge}</h3>
            </div>
            )
    }



}



export default Results;