from datetime import datetime
import pyrebase
from flask import Flask,render_template,request,session,redirect,url_for,flash
from flask_sqlalchemy import SQLAlchemy
from flask_login import UserMixin
from werkzeug.security import generate_password_hash,check_password_hash
from flask_login import login_user,logout_user,login_manager,LoginManager
from flask_login import login_required,current_user
from flask_mail import Mail
from django.contrib.messages import get_messages
from django.contrib import messages
from django.contrib.messages import constants as messages
import os
import json



# my database connection
local_server=True
#global_server=True
app = Flask(__name__)
app.secret_key="ayush"


#This is for getting the unique user access
login_manager=LoginManager(app)
login_manager.login_view='login'


@login_manager.user_loader
def load_user(user_id):
    return signin.query.get(int(user_id))




#app.config['SQLALCHEMY_DA4TABASE_URI']='mysql://username:password@localhost/databasename'
app.config['SQLALCHEMY_DATABASE_URI']='mysql://root:@localhost/hms'
db=SQLAlchemy(app)

#Databases
class Test(db.Model):
    id=db.Column(db.Integer,primary_key=True)
    name=db.column(db.String(50))


class modicine(db.Model, UserMixin):
    mid=db.Column(db.Integer,primary_key=True)
    name=db.Column(db.String(100))
    med=db.Column(db.String(100))
    quanity=db.Column(db.Integer)
    date=db.Column(db.DateTime, nullable = False)



class doctor(db.Model, UserMixin):
    did=db.Column(db.Integer,primary_key=True)
    Email=db.Column(db.String(50))
    Name=db.Column(db.String(50))
    dept=db.Column(db.String(50))


class signin(db.Model, UserMixin):
    id=db.Column(db.Integer,primary_key=True)
    Name=db.Column(db.String(30),unique=True)
    Email=db.Column(db.String(500),unique=True)
    Contact=db.Column(db.String(50),unique=True)
    password=db.Column(db.String(100000),unique=True)
    confirm=db.Column(db.String(100000),unique=True)
    type=db.Column(db.String(10))
    dept=db.Column(db.String(50))


class patients(db.Model, UserMixin):
    pid=db.Column(db.Integer,primary_key=True)
    same=db.Column(db.Integer)
    Name=db.Column(db.String(30))
    Email=db.Column(db.String(50))
    gender=db.Column(db.String(50))
    disease=db.Column(db.String(50))
    time=db.Column(db.String(50))
    dept=db.Column(db.String(50),nullable=False)
    phone=db.Column(db.String(12))


@app.route("/")
def index():
    if current_user==True:
        if current_user.type == "doctor":
            return render_template("docbase.html")
    return render_template("index.html")

@app.route("/appointment", methods=['POST','GET'])
@login_required
def appo():
    if request.method=="POST":
        same=current_user.id
        Email=current_user.Email
        Name=request.form.get('name')
        gender=request.form.get('gender')
        slot=request.form.get('slot')
        disease=request.form.get('disease')
        time=request.form.get('time')
        date=request.form.get('date')
        dept=request.form.get('dept')
        phone=request.form.get('phone')
        new_user=db.engine.execute(f"INSERT INTO `patients`(`same`,`Email`,`Name`,`gender`,`disease`,`time`,`date`,`dept`,`phone` ) VALUES('{same}','{Email}','{Name}','{gender}','{disease}','{time}','{date}','{dept}','{phone}')")
        print(id,Email,Name,gender,disease,time,date,dept,phone)
        flash('Your appointment request has been sent successfully. Thank you!' , 'info')
        return redirect(url_for("index")+"#appointment")
    
    seldoc=db.engine.execute(f"SELECT * FROM `doctor` ")
    print(seldoc)   
    return render_template("index.html", seldoc=seldoc, _anchor="appointment")

@app.route("/edit")
def edit(): 
    exist=current_user.id 
    query=db.engine.execute(f"SELECT * FROM `patients` WHERE same='{exist}'")
    return render_template("edit.html", query=query) 

@app.route("/appdetail")
def appdetail(): 
    exist=current_user.id 
    query=db.engine.execute(f"SELECT * FROM `patients` WHERE same='{exist}'")
    return render_template("appdetail.html", query=query)

@app.route("/docapp")
def docapp():
    exist=current_user.dept
    query=db.engine.execute(f"SELECT * FROM `patients` WHERE dept='{exist}'")
    return render_template("docbase.html", query=query) 

@app.route("/docedit")
def docedit(): 
    exist=current_user.dept
    query=db.engine.execute(f"SELECT * FROM `patients` WHERE dept='{exist}'")
    return render_template("docedit.html", query=query) 

@app.route("/medicine/<string:name>", methods=['POST','GET'])
@login_required
def medicine(name):
    if request.method=="POST":
        med=request.form.get('med')
        quantity=request.form.get('quantity')
        date = datetime.now()
        new_user=db.engine.execute(f"INSERT INTO `medicine`(`med`,`quantity`,`name`,`date`) VALUES('{med}','{quantity}','{name}','{date}')")

    query=db.engine.execute(f"SELECT * FROM `medicine` WHERE name='{name}'")
    print(name)
    return render_template("medicine.html", namee=name, query=query)


@app.route("/dele/<string:mid>/name/<string:name>",methods=['POST','GET'])
@login_required
def dele(mid,name):
    print(mid,name)
    db.engine.execute(f"DELETE FROM `medicine` WHERE `medicine`.`mid`={mid}")
    print(name)
    return redirect(url_for('medicine', name = name))
#redirect('/medicine/`name`')


@app.route("/med")
def med():
    name=current_user.Name
    query=db.engine.execute(f"SELECT * FROM `medicine` WHERE name='{name}'")
    return render_template("patmed.html", query=query)

 
@app.route("/login", methods=['POST','GET'])
def login():
    if request.method=="POST":
        Email=request.form.get('Email')
        password=request.form.get('password')
        type=request.form.get('type')
        user=signin.query.filter_by(Email=Email).first()
        print(user)
        if type=="doctor":
            if user and check_password_hash(user.password,password) and user.type==type:
                login_user(user)
                exist=current_user.dept
                query=db.engine.execute(f"SELECT * FROM `patients` WHERE dept='{exist}'")
                return render_template("docbase.html", query=query)
            else:
                flash('invalid credentials' , 'danger')
                return render_template("login.html")

        elif type=="patient":
            if user and check_password_hash(user.password,password) and user.type==type:
                login_user(user)
                print("patient")
                return render_template("index.html")
            else:
                flash('invalid credentials' , 'danger')
                return render_template("login.html")
        
        else:
            print(user,user.password,password)
            if user and check_password_hash(user.password,password):
                login_user(user)
                print("None")
                return render_template("index.html")
            else:
                flash('invalid credentials' , 'danger')
                return render_template("login.html")

    return render_template("login.html")

@app.route("/signup", methods=['POST','GET'])
def signup():
    if request.method=="POST":
        Name=request.form.get('Name')
        type=request.form.get('type')
        Email=request.form.get('Email')
        Contact=request.form.get('Contact')
        password=request.form.get('password')
        confirm=request.form.get('confirm')
        dept=request.form.get('dept')

        #Password Encryption
        encpassword=generate_password_hash(password)
        encconfirm=generate_password_hash(confirm)

        #Check Email and Contact Already exxist or not
        emailuser=signin.query.filter_by(Email=Email).first()
        contact=signin.query.filter_by(Contact=Contact).first()
        if (emailuser) or (contact):
            flash(' Email or Contact is already taken ' , 'warning')
            return render_template("signup.html")

        #Inserting Data into DataBase  
        new_user=db.engine.execute(f"INSERT INTO `signin`(`Name`,`Email`,`Contact`,`password`,`confirm`,`type`,`dept`) VALUES('{Name}','{Email}','{Contact}','{encpassword}','{encconfirm}','{type}','{dept}')")

        #Entering into Doctor Table if type = doctor
        if type == "doctor":
            doc_user=db.engine.execute(f"INSERT INTO `doctor`(`Email`,`Name`,`dept`) VALUES('{Email}','{Name}','{dept}')")

        flash("SignUp Success Please Login", "Success")
        return render_template("login.html")

    return render_template("signup.html")

@app.route('/logout')
@login_required
def logout():
    logout_user()
    flash("Logout Successful" , "warning")
    return redirect(url_for('login'))

#Appoitment
@app.route('/patlogin')
def patlogin():
    flash("Login Required" , "danger")
    return render_template('index.html')




@app.route("/delete/<string:pid>",methods=['POST','GET'])
@login_required
def delete(pid):
    db.engine.execute(f"DELETE FROM `patients` WHERE `patients`.`pid`={pid}")
    flash("Slot Deleted Successful","danger")
    return redirect('/docedit')

@app.route("/check/<string:pid>",methods=['POST','GET'])
@login_required
def check(pid):
    post=patients.query.filter_by(pid=pid).first()
    if request.method=="POST":
        Email=current_user.Email
        Name=request.form.get('Name')
        gender=request.form.get('gender')
        disease=request.form.get('disease')
        time=request.form.get('time')
        date=request.form.get('date')
        dept=request.form.get('dept')
        phone=request.form.get('phone')
        db.engine.execute(f"UPDATE `patients` SET `Email` = '{Email}', `Name` = '{Name}', `gender` = '{gender}', `disease` = '{disease}', `time` = '{time}', `date` = '{date}', `dept` = '{dept}', `phone` = '{phone}' WHERE `patients`.`pid` = {pid}")
        flash("Slot is Updates","success")
        return render_template("editdetail.html",post=post)

    return render_template("editdetail.html",post=post)




app.run(debug=True)

