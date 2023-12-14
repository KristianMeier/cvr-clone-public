import { Link } from 'react-router-dom'
import { routing } from '../../Constants/routing'

export const SearchNoResults = () => (
  <div className="search-no-results">
    <h3 className="message-title">No companies found</h3>
    <p>
      To see the companies in the database,&nbsp;
      <Link
        to={routing.userhint.path}
        className="user-hint-link">
        Click here
      </Link>
    </p>
  </div>
)
