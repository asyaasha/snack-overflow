function Question(props) {
  return(
    <div>{props.question.title}</div>
  );
}
class QuestionView extends React.Component {
  render() {
    const questions = this.props.questions || [];
    console.log(questions);
    return(
      <div>
        {questions.map((question, index) => <Question question={question} key={index} />)}
      </div>
    )
  }
}

class App extends React.Component {
  constructor(){
    super();
    this.state = {
      questions:[],
    }
  }

  fetchQuestions() {
    $.ajax({
      url:'/questions',
      method:'get',
      dataType: "json"
    }).done(response => {
      console.log(response);
      this.setState({
        questions:response
      });
    })
    .fail(error => {
      console.log(error);
    })
  }

  componentDidMount() {
    this.fetchQuestions();
  }

  render() {
    return(
      <QuestionView questions={this.state.questions} />
      );
  }
}
