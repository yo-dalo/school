import { createContext, useContext, useState,useEffect } from "react";
import { useNavigate } from 'react-router-dom';
import Yo from "../common/Helper/Yo"
import { toast } from 'react-toastify';
import eruda from "eruda"; 
import axios from "axios";

const AuthContext = createContext();

export const AuthProvider = ({ children }) => {
const go =   useNavigate()
  
  const [admin, setAdmin] = useState({
    isLogin:false,
    img:"",
    name:"_",
    phone:"",
    email:"",
    id:null,
    
  }); // or use token instead

const isLogin= async()=>{
   await Yo.get("/api/auth/t.php/").then((res)=>{
  //const res =  await axios.get("http://0.0.0.0:8081/school-api/api/bannerSlides/getall.php")
   const {email,user_id,name}= res?.data
     
    setAdmin({...admin,
    isLogin:true,
    email:email,
    id:user_id,
    name:name
    });
 }).catch((err)=>{
   console.log("isLogin filde")
   
 })
}


 useEffect(() => { 
   eruda.init();
  isLogin()
  }, []);




  const login = async (adminData) => {
    try {
   const res =  await Yo.post("/api/auth/login.php" ,
   //{phoneOrEmail:"1234567891",password:"10"}
   adminData
   )
  const {email,user_id,name}= res?.data
     
    setAdmin({...admin,
    isLogin:true,
    email:email,
    id:user_id,
    name:name
    });
    toast.success("Login successful")
    go("/")
    } catch (error) {
      toast.error(error.message)
    }
    
    
  };

  const logout = () => {
    setAdmin(null);
    // remove token from storage if used
  };

  return (
    <AuthContext.Provider value={{ admin, login, logout, }}>
      {children}
    </AuthContext.Provider>
  );
};

export const useAuth = () => useContext(AuthContext);
