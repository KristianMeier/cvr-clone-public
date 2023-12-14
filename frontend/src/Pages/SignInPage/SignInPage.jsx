import { useState } from 'react'
import { useNavigate } from 'react-router'
import { useAuthContext } from '../../Context/AuthContext'
import { Form } from '../../Components/Other/Form'
import { TextInput } from '../../Components/Other/TextInput'
import { routing } from '../../Constants/routing'

export const SignInPage = () => {
  const [name, setName] = useState('')
  const [password, setPassword] = useState('')
  const navigate = useNavigate()
  const { logIn } = useAuthContext()

  const handleSubmit = (e) => {
    e.preventDefault()
    const localStorageId = new Date().getTime().toString()

    const userObject = {
      localStorageId,
      name,
      password,
    }

    logIn(userObject)
    navigate(routing.myaccount.path)
    setName('')
    setPassword('')
  }

  return (
    <div className="sign-in-page">
      <h2>Login Page</h2>
      <article className="sign-in-container">
        <Form
          onClick={handleSubmit}
          btnText="Sign In">
          <TextInput
            placeholder="Insert name..."
            value={name}
            type="text"
            onChange={(e) => setName(e.target.value)}
            autoFocus
          />
          <TextInput
            placeholder="Insert password..."
            value={password}
            onChange={(e) => setPassword(e.target.value)}
            type="text"
          />
        </Form>
      </article>
    </div>
  )
}
