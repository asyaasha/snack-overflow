class QuestionView extends React.Component {
  render() {

    const questions = this.props.questions || [];
    return(
      <div className="container">
        <h2 className='red-text text-darken-2'>Snack Overflow</h2>
          {questions.map((question, index) => <Question question={question} key={index} />)}
        <div className="divider"></div>
      </div>
    )
  }
}
