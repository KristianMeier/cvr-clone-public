import { MyAccount } from '../Pages/MyAccount/MyAccount'
import { LandingPage } from '../Pages/LandingPage/LandingPage'
import { SignInPage } from '../Pages/SignInPage/SignInPage'
import { NoAccess } from '../Pages/NoAccess/NoAccess'
import { Company } from '../Pages/Company/Company'
import { UserHint } from '../Pages/UserHint/UserHint'
import { NoRoute } from '../Pages/NoRoute/NoRoute'
import { Virkopedia } from '../Pages/Virkopedia/Virkopedia'

// Routing
export const routing = {
  landingpage: {
    path: '/',
    element: <LandingPage />,
  },
  myaccount: {
    path: '/myaccount',
    element: <MyAccount />,
  },
  virkopedia: {
    path: '/virkopedia',
    element: <Virkopedia />,
  },
  signinpage: {
    path: '/signinpage',
    element: <SignInPage />,
  },
  noaccess: {
    path: '/noaccess',
    element: <NoAccess />,
  },
  company: {
    path: '/company/:routeParams',
    element: <Company />,
  },
  userhint: {
    path: '/userhint',
    element: <UserHint />,
  },
  noroute: {
    path: '/:routeParams',
    element: <NoRoute />,
  },
}
