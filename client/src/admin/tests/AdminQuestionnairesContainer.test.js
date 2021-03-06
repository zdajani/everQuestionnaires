import React from 'react'
import {shallow} from 'enzyme'

import {AdminQuestionnairesContainer} from '../containers/AdminQuestionnairesContainer'
import AdminQuestionnairesHeader from '../components/AdminQuestionnairesHeader'
import QuestionnairesList from '../../questionnaires/components/QuestionnairesList'
import Loading from '../../shared_components/Loading'

import {formattedData} from './testData'


const setup = (formattedData, isLoading) => (
  shallow(
    <AdminQuestionnairesContainer
      questionnaires={formattedData}
      isLoading={isLoading}
      match={{url: '/admin/questionnaires'}}
    />
  )
)


describe('AdminQuestionnaire container', () => {
  describe('when questionnaires data is available', () => {
    const container = setup(formattedData, false)

    it('renders the AdminQuestionnairesHeader', () => {
      expect(container.find(AdminQuestionnairesHeader)).toMatchSnapshot()
    })

    it('renders the QuestionnairesList', () => {
      expect(container.find(QuestionnairesList)).toMatchSnapshot()
    })

    it('does not render Loading component', () => {
      expect(container).not.toContainReact(<Loading />)
    })
  })

  describe('when loading', () => {
    const container = setup(null, true)

    it('renders loading component', () => {
      expect(container).toContainReact(<Loading />)
    })

    it('does not render QuestionnairesListComponent', () => {
      expect(container).not.toContainReact(
        <QuestionnairesList questionnaires={formattedData} url='/admin/questionnaires' />
      )
    })

    it('does not render AdminQuestionnairesHeader', () => {
      expect(container).not.toContainReact(<AdminQuestionnairesHeader />)
    })
  })
})