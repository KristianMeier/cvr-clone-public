import { DEFAULT_API_ENDPOINT } from '../../Constants/Constants'
import { useFetch } from '../../Hooks/useFetch'

export const Error = () => {
  const { error } = useFetch(DEFAULT_API_ENDPOINT)

  return <h2>{error?.message}</h2>
}
