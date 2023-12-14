import { BrowserRouter, Route, Routes } from 'react-router-dom'
import { Layout } from './Components/Layout/Layout'
import { ProtectedRoute } from './Components/Layout/ProtectedRoute/ProtectedRoute'
import { routing } from './Constants/routing'

export const App = () => (
  <BrowserRouter>
    <Routes>
      <Route element={<Layout />}>
        <Route
          index
          element={routing.landingpage.element}
        />
        <Route
          path={routing.virkopedia.path}
          element={routing.virkopedia.element}
        />
        <Route
          path={routing.signinpage.path}
          element={routing.signinpage.element}
        />
        <Route
          path={routing.company.path}
          element={routing.company.element}
        />
        <Route
          path={routing.userhint.path}
          element={routing.userhint.element}
        />
        <Route
          path={routing.myaccount.path}
          element={<ProtectedRoute>{routing.myaccount.element}</ProtectedRoute>}
        />
        <Route
          path={routing.noaccess.path}
          element={routing.noaccess.element}
        />
        <Route
          path={routing.noroute.path}
          element={routing.noroute.element}
        />
      </Route>
    </Routes>
  </BrowserRouter>
)
