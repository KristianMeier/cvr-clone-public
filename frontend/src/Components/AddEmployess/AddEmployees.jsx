import { useState, useEffect } from 'react'
import {
  EMPLOYEE_LOCAL_STORAGE_KEY,
  NO_EMPLOYEES_LOCAL_STORAGE_VALUE,
} from '../../Constants/Constants'
import { getLocalStorage } from '../../Utils/getLocalStorage'
import { AddEmployeesFormikForm } from './AddEmployeesFormikForm'
import { AddEmployeesTable } from './AddEmployeesTable'
import { AddEmployeesVanillaForm } from './AddEmployeesVanillaForm'

export const AddEmployees = () => {
  const savedEmployees = getLocalStorage(
    EMPLOYEE_LOCAL_STORAGE_KEY,
    NO_EMPLOYEES_LOCAL_STORAGE_VALUE
  )

  const [name, setName] = useState('')
  const [title, setTitle] = useState('')
  const [employees, setEmployees] = useState(JSON.parse(savedEmployees))
  const [vanillaFormIsShown, setVanillaFormIsShown] = useState(true)

  const handleVanillaFormSubmit = (e) => {
    e.preventDefault()
    const newEmployee = {
      localStorageId: new Date().getTime().toString(),
      name,
      title,
    }
    setEmployees([...employees, newEmployee])
    setName('')
    setTitle('')
  }

  const handleFormikFormSubmit = (values) => {
    const newEmployee = {
      localStorageId: new Date().getTime().toString(),
      name: values.name,
      title: values.title,
    }
    setEmployees([...employees, newEmployee])
  }

  const removeEmployee = (localStorageId) =>
    setEmployees(
      employees.filter((employee) => employee.localStorageId !== localStorageId)
    )

  useEffect(() => {
    localStorage.setItem(EMPLOYEE_LOCAL_STORAGE_KEY, JSON.stringify(employees))
  }, [employees])

  return (
    <div className='add-employess'>
      <h2>Grant employees access to www.cvr.dk</h2>
      <button
        className='swap-btn'
        onClick={() => setVanillaFormIsShown(!vanillaFormIsShown)}
      >
        {vanillaFormIsShown ? 'Swap to Formik Form' : 'Back to Vanilla Form'}
      </button>
      <div className='container'>
        {vanillaFormIsShown ? (
          <AddEmployeesVanillaForm
            handleVanillaFormSubmit={handleVanillaFormSubmit}
            name={name}
            title={title}
            setName={setName}
            setTitle={setTitle}
          />
        ) : (
          <AddEmployeesFormikForm
            handleFormikFormSubmit={handleFormikFormSubmit}
          />
        )}
        <AddEmployeesTable
          removeEmployee={removeEmployee}
          employees={employees}
        />
      </div>
    </div>
  )
}
