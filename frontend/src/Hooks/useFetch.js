import { useState, useEffect } from 'react'
import axios from 'axios'

export const useFetch = (endPoint) => {
  const [apiData, setApiData] = useState(null)
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState(null)

  useEffect(() => {
    const fetchData = async () => {
      try {
        const response = await axios.get(endPoint)
        setApiData(response.data)
        setError(null)
      } catch (err) {
        setError({
          ...err,
          message: err?.message
            ? err?.message
            : 'An unexpected error occurred!',
        })
      } finally {
        setLoading(false)
      }
    }

    fetchData()
  }, [endPoint])

  return { apiData, loading, error }
}
