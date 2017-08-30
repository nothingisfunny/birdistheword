import {
  createStore, 
  applyMiddleware,
  combineReducers, 
  compose
} from 'redux'

import thunk from 'redux-thunk'
import board from './reducers/board'

const reducers = combineReducers({
  board: board
})
const middleware = [thunk]

export default createStore(
  reducers,
  compose(
  applyMiddleware(...middleware),
  window.__REDUX_DEVTOOLS_EXTENSION__ && window.__REDUX_DEVTOOLS_EXTENSION__()
  )
)