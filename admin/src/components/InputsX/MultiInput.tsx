import InputX from './InputX';
import React, { useState, useEffect } from 'react';
import { CiCirclePlus } from "react-icons/ci";
import { CiCircleRemove } from "react-icons/ci";


const MultiInput = ({inputs,name,get,value=[]}) => {
    const [loop, setLoop] = useState([1]);
    const [all, setAll] = useState([]);
    
    

const addOrReplaceItem = (index, newItem) => {
    setAll((prevItems) => {
      if (index >= 0 && index < prevItems.length) {
        const updatedItems = [...prevItems];
        updatedItems[index] = newItem;
        return updatedItems;
      } else {
        return [...prevItems, newItem];
      }
    });
  };
  
  const deleteElement = (index) => {
    setLoop((prevItems) => prevItems.filter((_, i) => i !== index));
    setAll((prevItems) => prevItems.filter((_, i) => i !== index));
  };

    const add=(index,obj)=>{
   // setAll([...all,obj])
   console.info(obj);
    addOrReplaceItem(index,obj)
    
    }

  useEffect(()=>{
    console.log("value",value);
   get(all)
  },[all])
  
  
  return (
    <div className="min-w-full flex flex-col gap-1.5">
    <div className="font-semibold py-3"> Multi Input <CiCirclePlus className="text-blue-700" onClick={()=> setLoop([...loop,1])} /> </div>
   {loop.map((i,index)=>(
   <div key={index} className="relative">
   <InputX
     name={index}
    inputs={inputs}
    value={value[index]}
    get={(data)=>add(index,data)}
    />
    
    
    <CiCircleRemove onClick={(e)=>deleteElement(index)} className="absolute text-red-500 text-2xl z-40 bottom-2 right-2" />
    
   </div>
   
   
     )) }

    </div>
  )
}

export default MultiInput