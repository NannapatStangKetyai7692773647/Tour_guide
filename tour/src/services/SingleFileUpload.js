import http from "../http-common";

class Upload {
  single(file,folder) {  
    return http.post(`/upload/single/${folder}`,file);
  } 

  getFile(filename,folder) {
    const imext = ["jpg","jpeg","png","gif","webp"]
    const ext = filename.split('.').pop().toLowerCase()
    let type = 'img'; 
    if(ext.toLowerCase()==='pdf'){
       type = 'pdf'
    } 
    return http.get(`/upload/get/${type}/${folder}/${filename}`);
  } 
}

export default new Upload();
