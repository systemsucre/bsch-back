
import pool from './bdConfig.js'

export class Usuario {

    // METODOS

    buscar = async (dato) => {
        // console.log('los datos han llegado', dato)
        const sql =
            `SELECT pe.id, pe.username, pe.ci, pe.nombre,
            pe.apellido1,
            pe.apellido2,pe.celular, pe.sueldo, pe.validar 
            from personal pe 
            where (pe.nombre like '${dato}%' or
            pe.ci like '${dato}%' or
            pe.apellido1  like '${dato}%' or
            pe.apellido2  like '${dato}%') and pe.eliminado = false
            ORDER by pe.id`;
        const [rows] = await pool.query(sql)
        return rows
    }

    buscarEliminado = async (dato) => {
        // console.log('los datos han llegado', dato)    
        const sql =
            `SELECT pe.id, pe.username, pe.ci, pe.nombre,
            pe.apellido1,
            pe.apellido2,pe.celular, pe.sueldo, pe.validar 
            from personal pe 
            where (pe.nombre like '${dato}%' or
            pe.ci like '${dato}%' or
            pe.apellido1  like '${dato}%' or
            pe.apellido2  like '${dato}%') and pe.eliminado = true
            ORDER by pe.id`;
        const [rows] = await pool.query(sql)
        return rows
    }

    listar = async () => {
        const sql =
            `SELECT pe.id, pe.username, pe.ci, pe.nombre,
            pe.apellido1,
            pe.apellido2,pe.celular, pe.sueldo, pe.validar 
            from personal pe 
            where pe.eliminado = false
            ORDER by pe.id DESC limit 10;`;
        const [rows] = await pool.query(sql)
        // console.log(rows, 'lista')
        return rows
    }

    listarReciclaje = async () => {
        const sql =
            `SELECT pe.id, pe.username, pe.ci, pe.nombre,
            pe.apellido1,
            pe.apellido2,pe.celular, pe.sueldo, pe.validar 
            from personal pe 
            where pe.eliminado = true
            ORDER by pe.id DESC limit 10;`;
        const [rows] = await pool.query(sql)
        // console.log(rows, 'lista')
        return rows
    }



    listarSiguiente = async (id) => {
        const sql =
            `SELECT pe.id, pe.username, pe.ci, pe.nombre,
            pe.apellido1,
            pe.apellido2,pe.celular, pe.sueldo, pe.validar 
            from personal pe  where pe.eliminado = false
            and pe.id < ${pool.escape(id)} ORDER by id DESC  limit 10`;
        const [rows] = await pool.query(sql)
        return rows
    }

    listarSiguienteEliminados = async (id) => {
        const sql =
            `SELECT pe.id, pe.username, pe.ci, pe.nombre,
            pe.apellido1,
            pe.apellido2,pe.celular, pe.sueldo, pe.validar 
            from personal pe  where pe.eliminado = true
            and pe.id < ${pool.escape(id)} ORDER by id DESC  limit 10`;
        const [rows] = await pool.query(sql)
        return rows
    }



    listarAnterior = async (id) => {
        const sql =
            `SELECT pe.id, pe.username, pe.ci, pe.nombre,
            pe.apellido1,
            pe.apellido2,pe.celular, pe.sueldo, pe.validar 
            from personal pe 
            WHERE pe.id > ${pool.escape(id)} and pe.eliminado = false limit 10`;
        const [rows] = await pool.query(sql)
        rows.reverse()
        return rows
    }

    listarAnteriorEliminados = async (id) => {
        const sql =
            `SELECT pe.id, pe.username, pe.ci, pe.nombre,
            pe.apellido1,
            pe.apellido2,pe.celular, pe.sueldo, pe.validar 
            from personal pe 
            WHERE pe.id > ${pool.escape(id)} and pe.eliminado = true limit 10`;
        const [rows] = await pool.query(sql)
        rows.reverse()
        return rows
    }



    eliminar = async (datos) => {

        const sql = `update personal set eliminado = true , modificado = ${pool.escape(datos.modificado)}, usuario = ${pool.escape(datos.usuario)}
        WHERE id =  ${pool.escape(datos.id)}`;
        await pool.query(sql)
        return await this.listar()
    }

    restaurar = async (datos) => {
        const sql = `update personal set eliminado = false, modificado = ${pool.escape(datos.modificado)} , usuario = ${pool.escape(datos.usuario)}
        WHERE id =  ${pool.escape(datos.id)}`;
        await pool.query(sql)
        return await this.listar()
    }



















    listarAsignacion = async (id) => {
        const sql =
            `SELECT id, fecha monto, tipo, estado
            from asignacion
            where id = ${pool.escape(id)}
            ORDER by a.id DESC;`;
        const [rows] = await pool.query(sql)
        // console.log(rows, 'lista')
        return rows
    }




    ver = async (id) => {
        let sqlUser = null
        // console.log(id, 'modelo dell negocio')

        sqlUser = `select pe.id, pe.nombre, pe.apellido1, 
            pe.apellido2,pe.username, pe.ci,pe.creado, pe.modificado, 
            concat(personal.nombre, personal.apellido1, personal.apellido2) as creador, 
            pe.sueldo, pe.celular, DATE_FORMAT(pe.creado, "%Y-%m-%d %H:%m") as fechacreacion,
            DATE_FORMAT(pe.modificado, "%Y-%m-%d %H:%m") as fechamodificado, pe.validar,

            r.id as idRol, r.rol as rol 
            
            from personal pe
            left join rol r on r.id = pe.idrol
            left join personal on personal.id = pe.usuario
            
            where pe.id = ${pool.escape(id)}`

        const [result] = await pool.query(sqlUser)
        console.log(result)
        return result
    }



    listarRol = async () => {
        const sql =
            `SELECT id as id, rol as nombre from rol`;
        const [rows] = await pool.query(sql)

        return rows
    }

    listarProyectos = async () => {
        const sql =
            `SELECT id,nombre from proyecto`;
        const [rows] = await pool.query(sql)
        return rows
    }



    insertar = async (datos) => {

        const sqlexisteusername =
            `SELECT username from personal where
                username = ${pool.escape(datos.username)}`;
        const [rows] = await pool.query(sqlexisteusername)

        if (rows.length === 0) {
            const sqlexisteCi =
                `SELECT ci from personal where
                ci = ${pool.escape(datos.ci)}`;
            const [rowsCi] = await pool.query(sqlexisteCi)

            if (rowsCi.length === 0) {
                const resultado = await pool.query("INSERT INTO personal SET  ?", datos)
                return resultado
            } else return { existe: 2 }
        }
        else return { existe: 1 }
    }



    actualizarRol = async (datos) => {


        await pool.query("INSERT INTO rolusuario SET  ?", datos)
        return
    }


    validar = async (datos) => {
        const sql = `UPDATE personal SET
            idproyecto = ${pool.escape(datos.idproyecto)},
            idrol = ${pool.escape(datos.idrol)},
            sueldo = ${pool.escape(datos.sueldo)},
            validar = true,
            modificado = ${pool.escape(datos.modificado)},
            usuario = ${pool.escape(datos.usuario)}
            WHERE id = ${pool.escape(datos.id)}`;
        await pool.query(sql)
        return await this.listar()
    }


    deshabilitar = async (datos) => {
        const sql = `UPDATE personal SET
            validar = false,
            modificado = ${pool.escape(datos.modificado)},
            usuario = ${pool.escape(datos.usuario)}
            WHERE id = ${pool.escape(datos.id)}`;
        const result = await pool.query(sql)

        if (result[0].affectedRows === 1) {
            const ssql = `delete from sesion
                WHERE idpersonal = ${pool.escape(datos.id)}`;
            await pool.query(ssql)
        }
        const result_ = await this.ver(datos.id)
        return result_
    }

    habilitar = async (datos) => {
        const sql = `UPDATE personal SET
            validar = true,
            modificado = ${pool.escape(datos.modificado)},
            usuario = ${pool.escape(datos.usuario)}
            WHERE id = ${pool.escape(datos.id)}`;
        const result = await pool.query(sql)

        if (result[0].affectedRows === 1) {
            const ssql = `delete from sesion
                WHERE idpersonal = ${pool.escape(datos.id)}`;
            await pool.query(ssql)
        }
        const result_ = await this.ver(datos.id)
        return result_
    }






    cambiarMiContraseña = async (datos) => {
        const sqlExists = `SELECT * FROM personal WHERE 
            pass = ${pool.escape(datos.pass1)} 
            and id = ${pool.escape(datos.usuario)}`;
        const [result] = await pool.query(sqlExists)

        if (result.length > 0) {

            const sql = `UPDATE personal SET
                pass = ${pool.escape(datos.pass2)}
                WHERE id = ${pool.escape(datos.usuario)}`;

            await pool.query(sql);
            return true

        } else return false
    }



    recet = async (datos) => {
        const sqlExists = `delete from sesion where
            idpersonal = ${pool.escape(datos.id)}`;
        await pool.query(sqlExists)

        const sql = `UPDATE personal SET
                pass = ${pool.escape(datos.pass1)},
                usuario = ${pool.escape(datos.Usuario)},
                modificado = ${pool.escape(datos.fecha)}
                WHERE id = ${pool.escape(datos.id)}`;

        await pool.query(sql);
        return true

    }



    actualizarMiPerfil = async (datos) => {
        const sqlExists = `SELECT * FROM personal WHERE 
            ci = ${pool.escape(datos.ci)} 
            and id !=${pool.escape(datos.usuario)}`;
        const [result] = await pool.query(sqlExists)
        if (result.length === 0) {

            const sql = `UPDATE personal SET
                nombre = ${pool.escape(datos.nombre)},
                apellido1 = ${pool.escape(datos.apellido1)},
                apellido2 = ${pool.escape(datos.apellido2)},
                ci = ${pool.escape(datos.ci)},
                celular= ${pool.escape(datos.telefono)}
                WHERE id = ${pool.escape(datos.usuario)}`;
            await pool.query(sql);
            return await this.miPerfil(datos.usuario)
        } else return { existe: 1 }
    }

    miPerfil = async (id) => {
        const sql =
            `SELECT u.nombre, u.apellido1, u.apellido2, u.ci,  u.celular as telefono,
            u.username,r.rol as rol, u.pass, concat(p.nombre, p.apellido1, p.apellido2) as usuario,
            DATE_FORMAT(u.creado, "%Y-%m-%d") as creado, DATE_FORMAT(u.modificado, "%Y-%m-%d") as modificado
                     from personal u
                     left join personal p on p.id = u.usuario
                     left join rol r on u.idrol = r.id
                     where u.id = ${pool.escape(id)}
                     `;
        const [rows] = await pool.query(sql)
        console.log(rows)
        return rows
    }





}