export const SmallContainer = ({ onClick, title, btnText, content }) => (
  <div className="small-container">
    {title && <h2> {title} </h2>}
    {btnText && (
      <button
        className="action-btn"
        onClick={onClick}>
        {btnText}
      </button>
    )}
    <div>{content} </div>
  </div>
)
