import { createContext, useContext, useState,useEffect } from "react";
import { useNavigate } from 'react-router-dom';
import Yo from "../common/Helper/Yo"

const FormContext = createContext();

export const FormProvider = ({ children,path }) => {
//const go =   useNavigate()
  const [createData, setCreateData] = useState({})
  
 useEffect(() => { 
  setdata({})
  }, [path]);




  

  return (
    <FormContext.Provider value={{createData,setCreateData}}>
      {children}
    </FormContext.Provider>
  );
};

export const useForm = () => useContext(FormContext);
