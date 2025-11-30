import { createContext, useContext, useState,useEffect } from "react";
import { useNavigate } from 'react-router-dom';
import Yo from "../common/Helper/Yo"

const AuthContext = createContext();

export const AuthProvider = ({ children }) => {
const go =   useNavigate()
  
  
  
  
 useEffect(() => { 
  
  }, []);




  

  return (
    <AuthContext.Provider value={{  }}>
      {children}
    </AuthContext.Provider>
  );
};

export const useAuth = () => useContext(AuthContext);
