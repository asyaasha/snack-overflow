function Question(props) {
  return(
    );
}
class QuestionView extends React.Component {
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
      url:'/questions/index',
      method:'get'
    }).done(response => {
      console.log(response);
      this.setState({
        questions:response
      });
    });
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
