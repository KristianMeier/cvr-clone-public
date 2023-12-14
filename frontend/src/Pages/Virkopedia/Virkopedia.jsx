import { VirkopediaArticle } from './VirkopediaArticle'
import { VirkopediaTab } from './VirkopediaTab'
import { useState } from 'react'
import { Loading } from '../../Components/Other/Loading.jsx'
import { useFetch } from '../../Hooks/useFetch'
import { Error } from '../../Components/Other/Error'
import { DEFAULT_API_ENDPOINT } from '../../Constants/Constants'

export const Virkopedia = () => {
  const [activeButtonIndex, setActiveButtonIndex] = useState(0)
  const { apiData, loading, error } = useFetch(DEFAULT_API_ENDPOINT)

  if (loading) return <Loading />
  if (error) return <Error />

  const allArticles = apiData.virkopediaData

  const { paragraphs, heading } = allArticles[activeButtonIndex]

  return (
    <div className="virkopedia">
      <h2>Virkopedia</h2>
      <div className="virkopedia-container">
        <div className="btn-container">
          {allArticles.map(({ heading }, index) => (
            <VirkopediaTab
              key={heading + index}
              setActiveButtonIndex={setActiveButtonIndex}
              heading={heading}
              index={index}
              activeButtonIndex={activeButtonIndex}
            />
          ))}
        </div>
        <VirkopediaArticle
          heading={heading}
          paragraphs={paragraphs}
        />
      </div>
    </div>
  )
}
