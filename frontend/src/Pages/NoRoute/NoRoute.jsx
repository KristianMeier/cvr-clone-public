import { useNavigate, useParams } from 'react-router-dom'
import { SmallContainer } from '../../Components/Other/SmallContainer'
import { routing } from '../../Constants/routing'

export const NoRoute = () => {
  const { routeParams } = useParams()
  const navigate = useNavigate()

  return (
    <SmallContainer
      title={`Sorry, there is no site here: /${routeParams}.`}
      onClick={() => navigate(routing.landingpage.path)}
      btnText="To Frontpage"
    />
  )
}
