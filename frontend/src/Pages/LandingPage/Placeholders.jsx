import { Placeholder } from '../../Components/Placeholder/Placeholder'
import { PlaceholderWrapper } from '../../Components/Placeholder/PlaceholderWrapper'
import { Loading } from '../../Components/Other/Loading.jsx'
import { useFetch } from '../../Hooks/useFetch'
import { Error } from '../../Components/Other/Error'
import { DEFAULT_API_ENDPOINT } from '../../Constants/Constants'

export const Placeholders = () => {
  const { apiData, loading, error } = useFetch(DEFAULT_API_ENDPOINT)

  if (loading) return <Loading />
  if (error) return <Error />

  const placeholderWrapperData = [
    apiData.placeholderData.rowOne,
    apiData.placeholderData.rowTwo,
    apiData.placeholderData.rowThree,
  ]

  return (
    <>
      {placeholderWrapperData.map((placeholders) => (
        <PlaceholderWrapper key={placeholders}>
          {placeholders.map(({ className, title }) => (
            <Placeholder
              key={title}
              className={className}
              title={title}
            />
          ))}
        </PlaceholderWrapper>
      ))}
    </>
  )
}
