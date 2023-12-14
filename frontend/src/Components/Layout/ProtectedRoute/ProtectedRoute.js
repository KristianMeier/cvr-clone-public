import { Navigate } from 'react-router-dom'
import { LOG_OUT_LOCAL_STORAGE_VALUE } from '../../../Constants/Constants'
import { useAuthContext } from '../../../Context/AuthContext'
import { routing } from '../../../Constants/routing'

export const ProtectedRoute = ({ children }) => {
  const { loginValue } = useAuthContext()

  if (loginValue === LOG_OUT_LOCAL_STORAGE_VALUE)
    return <Navigate to={routing.noaccess.path} />

  return children
}
