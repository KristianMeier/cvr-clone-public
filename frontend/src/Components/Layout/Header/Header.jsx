import { Link } from 'react-router-dom'
import { staticData } from '../../../Constants/staticData'

const titleLinks = staticData.headerData.titleLinks

export const Header = () => (
  <div className="header">
    <h1 className="header-title">CVR - Business in Denmark</h1>
    <div className="header-container">
      {titleLinks.map(({ text, link }, index) => (
        <Link
          className="header-link"
          to={link}
          key={link + index}>
          {text}
        </Link>
      ))}
    </div>
  </div>
)
