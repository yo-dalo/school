import axios from "axios";

class Yo {
  static async get(url, config = { withCredentials: true }) {
    try {
      const response = await axios.get(url, config);
      return response.data;
    } catch (error) {
      
      return error;
    }
  }

  static async post(url, data = {}, config = { withCredentials: true }) {
    try {
      const response = await axios.post(url, data, config);
      return response.data;
    } catch (error) {
      return error;
    }
  }

  static async put(url, data = {}, config = { withCredentials: true }) {
    try {
      const response = await axios.put(url, data, config);
      return response.data;
    } catch (error) {
      return error;
    }
  }

  static async patch(url, data = {}, config = { withCredentials: true }) {
    try {
      const response = await axios.patch(url, data, config);
      return response.data;
    } catch (error) {
    
      return error;
    }
  }

  static async delete(url, config = { withCredentials: true }) {
    try {
      const response = await axios.delete(url, config);
      return response.data;
    } catch (error) {
    
      return error;
    }
  }
}

export default Yo;