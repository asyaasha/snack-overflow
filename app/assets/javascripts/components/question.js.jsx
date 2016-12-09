function Question(props) {
  return(
  <table className="section">
    <tbody>
      <tr>
        <td><strong>{ props.question.title }</strong>
          <span> asked by user { props.question.user.username }</span>
        </td>
      </tr>
    </tbody>
  </table>

  );
}
