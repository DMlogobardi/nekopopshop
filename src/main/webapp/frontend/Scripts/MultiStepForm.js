document.addEventListener("DOMContentLoaded", () => {
    const nextButtons = document.querySelectorAll(".next-step");
    const prevButtons = document.querySelectorAll(".prev-step");
    const cancelButtons = document.querySelectorAll(".cancel-step");
    const allSteps = document.querySelectorAll(".step-content");
    const stepIndicators = document.querySelectorAll(".registration-steps .step");

    function mostraSolo(stepId) {
        allSteps.forEach(step => {
            step.classList.remove("active");
            if (step.id === stepId) {
                step.classList.add("active");
            }
        });
    }

    function aggiornaIndicatori(stepIndex) {
        stepIndicators.forEach((step, index) => {
            step.classList.remove("active", "completed");
            if (index < stepIndex) {
                step.classList.add("completed");
            } else if (index === stepIndex) {
                step.classList.add("active");
            }
        });
    }

    function validaPassoCorrente() {
        const passoCorrente = document.querySelector(".step-content.active");
        if (!passoCorrente) return true;

        const inputsObbligatori = passoCorrente.querySelectorAll("[required]");
        let valido = true;

        inputsObbligatori.forEach(input => {
            if (!input.value) {
                input.classList.add("border-red-500");
                valido = false;
            } else {
                input.classList.remove("border-red-500");
            }
        });

        return valido;
    }

    nextButtons.forEach(button => {
        button.addEventListener("click", () => {
            if (!validaPassoCorrente()) {
                alert("Compila tutti i campi obbligatori");
                return;
            }

            const nextStepId = button.dataset.next + "-content";
            const nextIndex = parseInt(button.dataset.next.replace("step", "")) - 1;

            const nextStepContent = document.getElementById(nextStepId);
            if (nextStepContent) {
                nextStepContent.classList.remove("hidden");
            }

            mostraSolo(nextStepId);
            aggiornaIndicatori(nextIndex);

            if (button.dataset.next === "step3") {
                aggiornaStep3Conferma();
            }
        });
    });

    prevButtons.forEach(button => {
        button.addEventListener("click", () => {
            const prevStepId = button.dataset.prev + "-content";
            const prevIndex = parseInt(button.dataset.prev.replace("step", "")) - 1;
            mostraSolo(prevStepId);
            aggiornaIndicatori(prevIndex);
        });
    });

    cancelButtons.forEach(button => {
        button.addEventListener("click", () => {
            const step1 = document.getElementById("step1-content");
            if (step1) {
                const inputs = step1.querySelectorAll("input, select, textarea");
                inputs.forEach(input => {
                    if (input.type === "checkbox" || input.type === "radio") {
                        input.checked = false;
                    } else {
                        input.value = "";
                    }
                });
            }
        });
    });

    // Inizializzazione
    mostraSolo("step1-content");
    aggiornaIndicatori(0);
});

function aggiornaStep3Conferma() {
    const getValue = (id) => {
        const element = document.getElementById(id);
        return element ? element.value : "";
    };

    const formatDate = (dateString) => {
        if (!dateString) return "";
        const options = { day: '2-digit', month: 'long', year: 'numeric' };
        return new Date(dateString).toLocaleDateString('it-IT', options);
    };

    // Aggiorna i campi di conferma
    document.getElementById("confirm-name").textContent = getValue("name");
    document.getElementById("confirm-cognome").textContent = getValue("cognome");
    document.getElementById("confirm-nascita").textContent = formatDate(getValue("nascita"));
    document.getElementById("confirm-email").textContent = getValue("email");
    document.getElementById("confirm-cf").textContent = getValue("cf");
    document.getElementById("confirm-indirizzo").textContent =
        `${getValue("via")}, ${getValue("civico")} - ${getValue("cap")}`;
    document.getElementById("confirm-telefono").textContent =
        `${getValue("prefisso")} ${getValue("numero")}`;
    document.getElementById("confirm-nick").textContent = getValue("nick");
}