import { useNavigate } from 'react-router-dom'
import { SmallContainer } from '../../Components/Other/SmallContainer'
import { Loading } from '../../Components/Other/Loading.jsx'
import { useFetch } from '../../Hooks/useFetch'
import { Error } from '../../Components/Other/Error'
import { routing } from '../../Constants/routing'
import { DEFAULT_API_ENDPOINT } from '../../Constants/Constants'

export const UserHint = () => {
  const navigate = useNavigate()
  const { apiData, loading, error } = useFetch(DEFAULT_API_ENDPOINT)

  if (loading) return <Loading />
  if (error) return <Error />

  const allCompanies = apiData.searchData.companies

  const companyNames = allCompanies.map(({ companyName, index }) => (
    <p key={companyName + index}>{companyName}</p>
  ))

  return (
    <SmallContainer
      title="Beneath are the companies in the database"
      onClick={() => navigate(routing.landingpage.path)}
      btnText="To Frontpage"
      content={companyNames}
    />
  )
}
