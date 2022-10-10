CREATE DATABASE FincreRP;
USE FincreRP;

CREATE TABLE tblacciones (
  idaccion              INT           NOT NULL    IDENTITY    PRIMARY KEY,
  nombre_accion           VARCHAR(50)  NOT NULL,
  descripcion_accion  VARCHAR(45)  NOT NULL,
);

CREATE TABLE tblciudades (
  idciudad              INT           NOT NULL    IDENTITY    PRIMARY KEY,
  nombre_ciudad           VARCHAR(50)  NOT NULL,
);

CREATE TABLE tbldepartamentos (
  iddepartamento              INT           NOT NULL    IDENTITY    PRIMARY KEY,
  nombre_departamento           VARCHAR(50)  NOT NULL,
  descripcion_departamento  VARCHAR(45)  NOT NULL,
);

CREATE TABLE tblpuestos (
  idpuesto              INT           NOT NULL    IDENTITY    PRIMARY KEY,
  nombre_puesto           VARCHAR(50)  NOT NULL,
  descripcion_puesto  VARCHAR(45)  NOT NULL,
);

CREATE TABLE tblvistas (
  idvista              INT           NOT NULL    IDENTITY    PRIMARY KEY,
  nombre_vista           VARCHAR(50)  NOT NULL,
  descripcion_vista  VARCHAR(45)  NOT NULL,
  estado_vista  VARCHAR(20)  NOT NULL,
);

CREATE TABLE tblsucursales (
  idsucursal              INT           NOT NULL    IDENTITY    PRIMARY KEY,
  nombre_sucursal           VARCHAR(60)  NOT NULL,
  telefono_sucursal           VARCHAR(10)  NOT NULL,
  idciudad          INT  NOT NULL,
  calle_sucursal VARCHAR(60)  NOT NULL,
  coloia_sucursal VARCHAR(60)  NOT NULL,
  numerointerior_sucursal VARCHAR(10)  NOT NULL,
  numeroexterior_sucursal VARCHAR(10)  NOT NULL,
  codigopostal_sucursal VARCHAR(6)  NOT NULL,
  FOREIGN KEY (idciudad) REFERENCES tblciudades(idciudad)
);

CREATE TABLE tblempleados (
  idempleado              INT           NOT NULL    IDENTITY    PRIMARY KEY,
  primernombre_empleado           VARCHAR(30)  NOT NULL,
  segundonombre_empleado  VARCHAR(30)  NOT NULL,
  apellidopaterno_empleado  VARCHAR(30)  NOT NULL,
  apellidomaterno__empleado VARCHAR(30)  NOT NULL,
  telefono_empleado VARCHAR(10)  NOT NULL,
  correo_empleado VARCHAR(50)  NOT NULL,
  idpuesto INT,
  idsucursal INT,
  idciudad INT,
  calle_empleado VARCHAR(60)  NOT NULL,
  coloia_empleado VARCHAR(60)  NOT NULL,
  numerointerior_empleado VARCHAR(10)  NOT NULL,
  numeroexterior_empleado VARCHAR(10)  NOT NULL,
  codigopostal_empleado VARCHAR(6)  NOT NULL,
  sexo_empleado VARCHAR(1)  NOT NULL,
  fechanacimiento_empleado VARCHAR(10)  NOT NULL,
  idnomina INT,
  FOREIGN KEY (idpuesto) REFERENCES tblpuestos(idpuesto),
  FOREIGN KEY (idsucursal) REFERENCES tblsucursales(idsucursal),
  FOREIGN KEY (idciudad) REFERENCES tblciudades(idciudad)
);

CREATE TABLE tblempleados_detalle (
  idempleado_det              INT           NOT NULL    IDENTITY    PRIMARY KEY,
  idempleado           INT  NOT NULL,
  salariobruto_empleado_det  DECIMAL(2,2)  NOT NULL,
  salarioneto_empleado_det  DECIMAL(2,2)  NOT NULL,
  numerotarjeta_empleado_det INT  NOT NULL,
  cuentabanco_empleado_det VARCHAR(10)  NOT NULL,
  rfc_empleado_det VARCHAR(10)  NOT NULL,
  nss_empleado_det VARCHAR(13)  NOT NULL,
  tiposangre_empleado_det VARCHAR(2)  NOT NULL,
  contactoemergencia_empleado_det VARCHAR(10)  NOT NULL,
  FOREIGN KEY (idempleado) REFERENCES tblempleados(idempleado)
);

CREATE TABLE tblusuarios (
  idusuario              INT           NOT NULL    IDENTITY    PRIMARY KEY,
  contraseña_usuario           VARCHAR(45)  NOT NULL,
  correo_usuario           VARCHAR(45)  NOT NULL,
  idempleado INT,
  fechacreacion_usuario           VARCHAR(10)  NOT NULL,
  estado_usuario           VARCHAR(4)  NOT NULL,
  FOREIGN KEY (idempleado) REFERENCES tblempleados(idempleado)
);

CREATE TABLE tblusuarios_permisos (
  idusuario_permiso              INT           NOT NULL    IDENTITY    PRIMARY KEY,
  idusuario   INT,
  idvista INT,
  idaccion INT,
  fechacreacion_usuario_permiso           VARCHAR(10)  NOT NULL,
  estado_usuario_permiso          VARCHAR(4)  NOT NULL,
  FOREIGN KEY (idusuario) REFERENCES tblusuarios(idusuario),
  FOREIGN KEY (idvista) REFERENCES tblvistas(idvista),
  FOREIGN KEY (idaccion) REFERENCES tblacciones(idaccion)
);

CREATE TABLE tblpermisos_sucursales (
  idpermiso_sucursal              INT           NOT NULL    IDENTITY    PRIMARY KEY,
  idsucursal  INT,
  idusuario INT,
  FOREIGN KEY (idsucursal) REFERENCES tblsucursales(idsucursal),
  FOREIGN KEY (idusuario) REFERENCES tblusuarios(idusuario)
);

CREATE TABLE tblreportes(
  idreporte              INT           NOT NULL    IDENTITY    PRIMARY KEY,
  iddepartamento INT,
  nombre_reporte VARCHAR(45)NOT NULL,
  storedprocedimiento_reporte VARCHAR(45)NOT NULL,
  estado_reporte VARCHAR(45)NOT NULL,
  FOREIGN KEY (iddepartamento) REFERENCES tbldepartamentos(iddepartamento)
);
