import { Router } from "express"
import { Usuario } from "../modelo/usuario.js"
import { eliminar, buscar, siguiente,insertar,actualizar, deshabilitar, habilitar } from '../validacion/usuario.js'
import pool from '../modelo/bdConfig.js'
import { CLAVEGMAIL } from '../config.js'
import nodemailer from "nodemailer";
//const modelo from "../modelo/usuario.js"
// desde esta plantilla se importa las funcionalidades de los controladores de los modulos


const rutas = Router()
const usuarios = new Usuario()


rutas.post("/usuario", async (req, res) => {
    // console.log(req.body, 'controlador')
    try {
        const resultado = await usuarios.listarAsignacion(req.body.id)
        return res.json({ data: resultado, ok: true })
    } catch (error) {
        console.log(error)
        return res.json({ ok: false, msg: 'Error en el servidor' })
    }
})




rutas.post("/ver", async (req, res) => {
    // console.log(req.body, 'ver usuario')
    try {
        const resultado = await usuarios.ver(req.body.id)
        // console.log(resultado)
        return res.json({ data: resultado, ok: true })
    } catch (error) {
        console.log(error)
        return res.json({ ok: false, msg: 'Error en el servidor' })
    }
})




rutas.post("/rol", async (req, res) => {
    try {
        const resultado = await usuarios.listarRol()
        return res.json(resultado)
    } catch (error) {
        return res.status(500).send(error)
    }
})

rutas.post("/proyectos", async (req, res) => {
    try {
        const resultado = await usuarios.listarProyectos()
        return res.json(resultado)
    } catch (error) {
        return res.status(500).send(error)
    }
})



rutas.post("/buscar", buscar, async (req, res) => {
    // console.log(req.body)
    const dato = req.body.dato
    try {
        const resultado = await usuarios.buscar(dato)
        return res.send({ data: resultado, ok: true })
    } catch (error) {
        console.log(error)
        return res.json({ ok: false, msg: 'Error en el servidor' })
    }

})
rutas.post("/buscareliminados", buscar, async (req, res) => {
    // console.log(req.body)
    const dato = req.body.dato
    try {
        const resultado = await usuarios.buscarEliminado(dato)
        return res.send({ data: resultado, ok: true })
    } catch (error) {
        console.log(error)
        return res.json({ ok: false, msg: 'Error en el servidor' })
    }

})



rutas.post("/deshabilitar", deshabilitar, async (req, res) => {
    // console.log(req.body)
    try {
        const { id, modificado, usuario } = req.body;
        const datos = {
            id, modificado, usuario
        }
        const sqlRestricciones = `
        select a.estado from personal p inner join asignacion a on p.id = a.idpersonal
        where p.id = ${pool.escape(id)} and (a.estado = 1 or a.estado = 2) and a.eliminado = false
    `
        const [restricciones] = await pool.query(sqlRestricciones)
        if (restricciones.length === 0) {
            const resultado = await usuarios.deshabilitar(datos)
            console.log(resultado)
            return res.json({ data: resultado, ok: true, msg: 'El usuario se ha deshabilitado exitosamente' })
        } else return res.json({ ok: false, msg: 'El usurio debe rendir cuentas' })
    } catch (error) {
        console.log(error)
        return res.json({ ok: false, msg: 'Error del servidor' })
    }

})

rutas.post("/habilitar", habilitar, async (req, res) => {
    // console.log(req.body)
    try{
        
        const {id, idrol, sueldo, modificado, usuario} = req.body
        const datos = {
            id,
            idrol,
            sueldo,
            modificado,
            usuario
        }
            const resultado = await usuarios.habilitar(datos)
            console.log(resultado)
            return res.json({ data: resultado, ok: true, msg: 'El usuario se ha habilitado exitosamente' })
       
    } catch (error) {
        console.log(error)
        return res.json({ ok: false, msg: 'Error del servidor' })
    }

})

rutas.post("/eliminar", eliminar, async (req, res) => {
    console.log(req.body)
    try {

        const { id, fecha, usuario } = req.body;
        const datos = {
            id, modificado: fecha, usuario
        }
        const sqlRestricciones = `
        select a.estado from personal p inner join asignacion a on p.id = a.idpersonal
        where p.id = ${pool.escape(id)} and (a.estado = 1 or a.estado = 2) and a.eliminado = false`
        const [restricciones] = await pool.query(sqlRestricciones)
        if (restricciones.length === 0) {
            const resultado = await usuarios.eliminar(datos)
            return res.json({ data: resultado, ok: true, msg: 'El usuario se ha eliminado exitosamente' })
        } else return res.json({ ok: false, msg: 'El usurio debe rendir cuentas' })
    } catch (error) {
        console.log(error)
        return res.json({ ok: false, msg: 'Error, Elimine los registros dependientes' })
    }

})
rutas.post("/restaurar", eliminar, async (req, res) => {
    // console.log(req.body)
    try {
        const { id, fecha, usuario } = req.body;
        const datos = {
            id, modificado: fecha, usuario
        }
        const resultado = await usuarios.restaurar(datos)
        if (resultado.affectedRows === 0)
            return res.json({ msg: "No existe el registro", ok: false });
        return res.json({ ok: true, data: resultado, msg: 'El registro se ha restaurado' })
    } catch (error) {
        return res.json({ ok: false, msg: 'Error en el Servidor' })
    }
})


rutas.post("/next", siguiente, async (req, res) => {

    let id = req.body.id
    try {
        const resultado = await usuarios.listarSiguiente(id)
        if (resultado.length > 0)
            return res.json({ ok: true, data: resultado })
        else
            return res.json({ ok: false, msg: 'Ya no hay mas registros!' })
    } catch (error) {
        console.log(error)
        return res.json({ ok: false, msg: 'Error en el servidor' })
    }
})

rutas.post("/nextdelete", siguiente, async (req, res) => {
    console.log('nextdelete')

    let id = req.body.id
    try {
        const resultado = await usuarios.listarSiguienteEliminados(id)
        if (resultado.length > 0)
            return res.json({ ok: true, data: resultado })
        else
            return res.json({ ok: false, msg: 'Ya no hay mas registros!' })
    } catch (error) {
        console.log(error)
        return res.json({ ok: false, msg: 'Error en el servidor' })
    }
})


rutas.post("/anterior", siguiente, async (req, res) => {
    let id = req.body.id
    try {
        const resultado = await usuarios.listarAnterior(id)
        if (resultado.length > 0)
            return res.json({ ok: true, data: resultado })
        else
            return res.json({ ok: false, msg: 'Ya no hay mas registros!' })
    } catch (error) {
        console.log(error)
        return res.json({ ok: false, msg: 'Error en el servidor' })
    }

})
rutas.post("/anterioreliminados", siguiente, async (req, res) => {
    let id = req.body.id
    try {
        const resultado = await usuarios.listarAnteriorEliminados(id)
        if (resultado.length > 0)
            return res.json({ ok: true, data: resultado })
        else
            return res.json({ ok: false, msg: 'Ya no hay mas registros!' })
    } catch (error) {
        console.log(error)
        return res.json({ ok: false, msg: 'Error en el servidor' })
    }

})


rutas.post("/all", async (req, res) => {
    // console.log(req.body, 'controlador')  
    try {
        const resultado = await usuarios.listar()
        return res.json({ data: resultado, ok: true })
    } catch (error) {
        console.log(error)
        return res.json({ ok: false, msg: 'Error en el servidor' })
    }
})



rutas.post("/reciclaje", async (req, res) => {
    try {
        const resultado = await usuarios.listarReciclaje()
        return res.json({ data: resultado, ok: true })
    } catch (error) {
        return res.json({ ok: false, msg: 'Error en el Servidor' })
    }

})

rutas.post("/recet", async (req, res) => {
    console.log(req.body, 'recetear contraseña')
    const { pass1, id, usuario, fecha } = req.body
    const datos = { pass1, id, usuario, fecha }
    try {
        await usuarios.recet(datos).then(j => {
            if (j) res.json({msg: 'La contraseña se ha cambiado correctamente', ok: true })
        })
    } catch (error) {
        console.log(error)
        return res.json({ ok: false, msg: 'Error en el servidor' })
    }
})




rutas.post("/buscarAsignacion", buscar, async (req, res) => {
    // console.log(req.body)
    const dato = req.body.dato
    try {
        const resultado = await usuarios.buscarAsinacionUsuario(dato)
        return res.send({ data: resultado, ok: true })
    } catch (error) {
        console.log(error)
        return res.json({ ok: false, msg: 'Error en el servidor' })
    }

})








rutas.post("/listarasignacion", async (req, res) => {
    // console.log(req.body, 'controlador')  
    try {
        const resultado = await usuarios.listarAsignacionUsuario()
        return res.json({ data: resultado, ok: true })
    } catch (error) {
        console.log(error)
        return res.json({ ok: false, msg: 'Error en el servidor' })
    }
})

rutas.post("/nextListarAsignacion", siguiente, async (req, res) => {

    let id = req.body.id
    try {
        const resultado = await usuarios.listarSiguienteAsinacionUsuario(id)
        if (resultado.length > 0)
            return res.json({ ok: true, data: resultado })
        else
            return res.json({ ok: false, msg: 'Ya no hay mas registros!' })
    } catch (error) {
        console.log(error)
        return res.json({ ok: false, msg: 'Error en el servidor' })
    }
})

rutas.post("/anteriorListarAsignacion", siguiente, async (req, res) => {
    let id = req.body.id
    try {
        const resultado = await usuarios.listarAnteriorAsinacionUsuario(id)
        if (resultado.length > 0)
            return res.json({ ok: true, data: resultado })
        else
            return res.json({ ok: false, msg: 'Ya no hay mas registros!' })
    } catch (error) {
        console.log(error)
        return res.json({ ok: false, msg: 'Error en el servidor' })
    }

})



rutas.post("/registrar", insertar, async (req, res) => {

    console.log('datos: ', req.body)

    const {idrol, sueldo, username, xyz, ci, nombre, apellido1,
        apellido2, telefono, creado, usuario } = req.body
    const datos = {
        idrol,
        sueldo,
        username,
        pass: xyz,
        ci,
        nombre,
        apellido1,
        apellido2,
        celular: telefono,
        validar:1,
        creado,
        usuario
    }
    try {
        const resultado = await usuarios.insertar(datos)

        if (resultado.existe === 1)
            return res.json({ ok: false, msg: 'Este usuario ya esta registrado' })
        if (resultado.existe === 2)
            return res.json({ ok: false, msg: 'Este C.I. ya esta registrado' })
        else
            return res.json({data:resultado, ok: true, msg: "El Usuario se ha registrado correctamente" });

    } catch (error) {
        console.log(error)
        return res.json({ msg: 'Error en el Servidor', ok: false })
    }
})


rutas.post("/actualizar", actualizar, async (req, res) => {

    console.log('datos: ', req.body)

    const {id,idrol, sueldo, ci, nombre, apellido1,
        apellido2, telefono, modificado, usuario } = req.body
    const datos = {
        id,
        idrol,
        sueldo,
        ci,
        nombre,
        apellido1,
        apellido2,
        celular: telefono,
        modificado,
        usuario
    }
    try {
        const resultado = await usuarios.actualizar(datos)

        if (resultado.existe === 1)
            return res.json({ ok: false, msg: 'Este usuario ya esta registrado' })
        if (resultado.existe === 2)
            return res.json({ ok: false, msg: 'Este C.I. ya esta registrado' })
        else
            return res.json({data:resultado, ok: true, msg: "El Usuario se ha registrado correctamente" });

    } catch (error) {
        console.log(error)
        return res.json({ msg: 'Error en el Servidor', ok: false })
    }
})


export default rutas;