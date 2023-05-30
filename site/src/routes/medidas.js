var express = require("express");
var router = express.Router();

var medidaController = require("../controllers/medidaController");

router.get("/ultimas/:idEstadio/setores", function (req, res) {
    medidaController.buscarUltimasMedidasSetores(req, res);
});

router.get("/ultimas/:idEstadio/setor:idSetor", function (req, res) {
    medidaController.buscarUltimasMedidasSetor(req, res);
});

router.get("/tempo-real/:idEstadio/setores", function (req, res) {
    medidaController.buscarMedidasEmTempoRealSetores(req, res);
})

router.get("/tempo-real/:idEstadio/setor:idSetor", function (req, res) {
    medidaController.buscarMedidasSetor(req, res);
});

module.exports = router;