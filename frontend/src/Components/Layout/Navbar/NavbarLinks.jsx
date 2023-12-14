import { useEffect } from 'react'
import { Link } from 'react-router-dom'
import {
  LOG_OUT_LOCAL_STORAGE_VALUE,
  THEME_LOCAL_STORAGE_KEY,
} from '../../../Constants/Constants'
import { useAuthContext } from '../../../Context/AuthContext'
import { useThemeContext } from '../../../Context/ThemeContext'
import { routing } from '../../../Constants/routing'

export const NavbarLinks = ({ linksContainerRef, linksRef }) => {
  const { loginValue } = useAuthContext()
  const { isDarkTheme, theme, toggleTheme } = useThemeContext()

  useEffect(() => {
    localStorage.setItem(THEME_LOCAL_STORAGE_KEY, theme)
  }, [theme])

  return (
    <div
      className="links-container"
      ref={linksContainerRef}>
      <ul
        className="links"
        ref={linksRef}>
        <button
          className="theme-btn"
          onClick={() => toggleTheme()}>
          {isDarkTheme ? 'Light Theme' : 'Dark Theme'}
        </button>
        {loginValue !== LOG_OUT_LOCAL_STORAGE_VALUE ? (
          <Link
            className="nav-links"
            to={routing.myaccount.path}>
            My Account
          </Link>
        ) : (
          <Link
            className="nav-links"
            to={routing.signinpage.path}>
            Sign In
          </Link>
        )}
      </ul>
    </div>
  )
}
