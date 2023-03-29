module.exports = app => {  
    var router = require("express").Router();
  
    
  const multer  = require('multer') 
  const path = require('path'); 
  const fs = require('fs');

 
  const upload = multer({
    storage: multer.diskStorage({
      
      destination: (req, file, cb) => {    
          let folder = req.params.folder;
          let directory = './uploads/' 
          if(folder!==undefined){
            directory = `./uploads/${folder}` 
          }else{
              cb(null, `./uploads/`);
          }  
    
          if (!fs.existsSync(directory)) {
            fs.mkdirSync(directory, { recursive: true })
          }
    
          cb(null, directory) 
      },
      filename: (req, file, cb) => {  
        cb(null, `${(Math.random() + 1).toString(36).substring(2,7)}-${file.originalname.replace(/ /g,'-')}`)
      }
    })
  }) 

  router.post('/single/:folder',upload.single('file'), function (req,res){  
       
          res.send({status: true, filename: req.file.filename })
  });
 
  
  router.get('/get/pdf/:folder/:filename', function (req,res){  
    const  path = __dirname+`/../../uploads/${req.params.folder}/${req.params.filename}` 
    try{
      fs.readFile(path , function (err,data){
        res.contentType("application/pdf");
        if(data!==undefined&&data!==null){
          res.send(data.toString('base64'));
        }
    }); 
    } catch(e){
      console.log(e)
    }
  }); 

  
  router.get('/get/img/:folder/:filename', function (req,res){  
    const  path = __dirname+`/../../uploads/${req.params.folder}/${req.params.filename}` 
      fs.readFile(path , function (err,data){ 
        
        res.contentType("image/png");
        if(data!==undefined&&data!==null){
          res.send(data.toString('base64'));
        }else{
          res.send({ message:'not found'})
        }
    }); 
  }); 
    app.use('/api/upload', router);
  };