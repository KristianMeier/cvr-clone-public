import { useNavigate } from 'react-router'
import { SmallContainer } from '../../Components/Other/SmallContainer'
import { routing } from '../../Constants/routing'

export const NoAccess = () => {
  const navigate = useNavigate()

  return (
    <SmallContainer
      title="You need to sign in to access your Account"
      onClick={() => navigate(routing.signinpage.path)}
      btnText="Sign In"
    />
  )
}
