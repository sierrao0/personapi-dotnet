# **Persona API - Sistema de Gestión de Personas**  

Aplicación web desarrollada en **ASP.NET Core** con **Entity Framework Core** para gestionar personas, profesiones, estudios y teléfonos. Incluye una **API RESTful** y una **interfaz MVC** generada automáticamente con scaffolding.  

---

## **Tecnologías Utilizadas**  
- **Backend**: ASP.NET Core 6.0  
- **Base de datos**: SQL Server (Docker)  
- **ORM**: Entity Framework Core  
- **Frontend**: Vistas Razor + Bootstrap  
- **Contenedores**: Docker + Docker Compose  

---

## **Instrucciones para Ejecutar el Proyecto**  

### **1. Configuración Inicial con Docker**  
Ejecuta el siguiente comando para construir y levantar los contenedores:  
```bash
docker-compose up --build
```
Esto iniciará:  
- **SQL Server** en `localhost,1433` (usuario: `sa`, contraseña: `Password123!`).  
- **Aplicación ASP.NET** en `http://localhost:8080`.  

---

### **2. Configurar la Base de Datos**  
1. Abre **SQL Server Management Studio (SSMS)** o Azure Data Studio.  
2. Conéctate al servidor:  
   - **Servidor**: `localhost,1433`  
   - **Autenticación**: SQL Server  
   - **Usuario**: `sa`  
   - **Contraseña**: `Password123!`  
3. Ejecuta el script SQL ubicado en:  
   ```
   DDL/Lab1_tablas.sql
   ```
   Este script creará las tablas: `persona`, `profesion`, `estudio` y `telefono`.  

---

### **3. Acceder a la Aplicación**  
Abre tu navegador en:  
```
http://localhost:8080
```
Verás una interfaz con botones para gestionar:  
- 👥 **Personas**  
- 💼 **Profesiones**  
- 📚 **Estudios**  
- 📞 **Teléfonos**  

---

## **Estructura del Proyecto**  
```
personapi-dotnet/
├── Controllers/      # Controladores MVC y API
├── Models/           # Entidades EF Core + Repositorios
├── Views/            # Vistas generadas (Index, Create, Edit, etc.)
├── DDL/              # Scripts SQL iniciales
├── Dockerfile        # Configuración del contenedor ASP.NET
└── docker-compose.yml # Orquestación de SQL Server + App
```

---

## **Endpoints de la API**  
| Método | Ruta                | Descripción                  |
|--------|---------------------|------------------------------|
| GET    | `/api/personas`     | Listar todas las personas    |
| POST   | `/api/personas`     | Crear nueva persona          |
| GET    | `/api/personas/{cc}`| Obtener persona por cédula   |
| PUT    | `/api/personas/{cc}`| Actualizar persona           |
| DELETE | `/api/personas/{cc}`| Eliminar persona             |

*(Endpoints similares para `/profesiones`, `/estudios`, `/telefonos`)*  

---

## **Licencia**  
MIT License.  

--- 

**¡Listo!** El proyecto debería estar funcionando correctamente. 🚀  
Para detener los contenedores, usa:  
```bash
docker-compose down
```
