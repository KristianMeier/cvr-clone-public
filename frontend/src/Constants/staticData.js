import { routing } from './routing'

export const staticData = {
  headerData: {
    titleLinks: [
      {
        text: 'Search CVR',
        link: routing.landingpage.path,
      },
      {
        text: 'Virkopedia',
        link: routing.virkopedia.path,
      },
      {
        text: 'My Account',
        link: routing.myaccount.path,
      },
    ],
  },
  footerData: {
    firstColumn: [
      'Topics',
      'Find selfservice or more',
      'Authorities',
      'Find Selfservice',
    ],
    secondColumn: [
      'Contact CVR',
      'Cookies',
      'Find Selfservice',
      'Personal Data',
      'Declaration of access',
    ],
    thirdColumn: [
      'Virk',
      'New rules',
      'Privacy',
      'Security Check',
      'Cvr.dk Assistent',
    ],
  },
}
