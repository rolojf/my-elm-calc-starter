module.exports = {
   content: {
      files: ["./src/**/*.elm"],
      extract: {
         elm: (contenido) => {
            let matchado = contenido.match(/.*"\s*tw\s([a-z0-9-].+?)"/);
            let regresa = matchado ? matchado[1].split(" ") : [];
            if (regresa.length > 0) {
               console.log("elm classes: " + regresa);
            }
            return regresa;
         },
         html: (contenido) => {
            let matchado = contenido.match(/class\s?=\s?"(.+?)"/);
            let regresa = matchado ? matchado[1].split(" ") : [];
            // if (regresa.length>0) {console.log("html: " + regresa)};
            return regresa;
         },
      },
   },
   theme: {
      extend: {},
   },
   plugins: [require("@tailwindcss/typography")],
};
