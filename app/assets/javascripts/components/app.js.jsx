class App extends React.Component {
  constructor(){
    super();
    this.state = {
      questions:[],
      users:[]
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
      <div>
      <QuestionView questions={this.state.questions} />

      </div>
      );
  }
}
