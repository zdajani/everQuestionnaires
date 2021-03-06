import React from 'react'
import {Field} from 'redux-form'
import renderField from '../../shared_components/Field'
import {required} from '../validations'

const AuthFormFields = () => (
  <>
    <Field
      label='Username:'
      name='username'
      component={renderField}
      validate={required}
    />
    <Field
      label='Password:'
      name='password'
      type='password'
      component={renderField}
      validate={required}
    />
  </>
)

export default AuthFormFields
