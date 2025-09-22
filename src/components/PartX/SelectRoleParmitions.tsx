import React, { useState, useEffect } from 'react';
import Yo from '../../common/Helper/Yo';

const SelectRoleParmitions = ({send}) => {
  const [myp, setMyp] = useState([]);
  const [selectedPermissions, setSelectedPermissions] = useState([]);

  const handleCheckboxChange = (e, permissionId) => {
    let updated;
    if (e.target.checked) {
      updated = [...selectedPermissions, permissionId];
    } else {
      updated = selectedPermissions.filter(id => id !== permissionId);
    }

    setSelectedPermissions(updated);
    send?.("permissions",updated); // parent ko bhejna
  };
  const getParmissions = async () => {
    const res = await Yo.get("/api/permissions/");
    console.log(res);
    setMyp(res.data);
  };

  useEffect(() => {
    getParmissions();
  }, []);
  
  
 
  
  
  

  return (
    <div className="w-full mt-8 p-6 bg-white rounded-2xl shadow-md border border-gray-200 dark:border-strokedark dark:bg-boxdark">
      <h2 className="text-xl font-semibold text-gray-700 mb-4 dark:text-white">Select Permissions</h2>
      <div className="space-y-3">
        {myp.map((permission) => (
          <label
            key={permission.id}
            className="flex items-center space-x-3 text-gray-600 hover:text-gray-800 dark:text-white"
          >
            <input
              type="checkbox"
              className="accent-blue-600 w-5 h-5"
              checked={selectedPermissions.includes(permission.id)}
              onChange={(e) => handleCheckboxChange(e, permission.id)}
            />
            <span className="capitalize">{permission.name}</span>
          </label>
        ))}
      </div>

      <div className="mt-6">
        <h4 className="text-sm font-medium text-gray-500 dark:text-white">Selected:</h4>
        <div className="text-blue-600 mt-1 text-sm">
          {JSON.stringify(selectedPermissions)}
        </div>
      </div>
    </div>
  );
};

export default SelectRoleParmitions;