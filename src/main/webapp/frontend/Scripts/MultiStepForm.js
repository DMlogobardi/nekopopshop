document.addEventListener("DOMContentLoaded", () => {
    const nextButtons = document.querySelectorAll(".next-step");
    const prevButtons = document.querySelectorAll(".prev-step");
    const cancelButtons = document.querySelectorAll(".cancel-step");
    const allSteps = document.querySelectorAll(".step-content");
    const stepIndicators = document.querySelectorAll(".registration-steps .step");

    function mostraSolo(stepId) {
        allSteps.forEach(step => {
            step.style.display = step.id === stepId ? "block" : "none";
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

    nextButtons.forEach(button => {
        button.addEventListener("click", () => {
            const nextStepId = button.dataset.next + "-content";
            const nextIndex = parseInt(button.dataset.next.replace("step", "")) - 1;
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

    // Mostra solo il primo step all'avvio
    mostraSolo("step1-content");
    aggiornaIndicatori(0);
});

function aggiornaStep3Conferma() {
    const nome = document.getElementById("name")?.value.trim() || "";
    const cognome = document.getElementById("cognome")?.value.trim() || "";
    const nascita = document.getElementById("nascita")?.value || "";
    const email = document.getElementById("email")?.value.trim() || "";
    const cf = document.getElementById("cf")?.value.trim() || "";
    const via = document.getElementById("via")?.value.trim() || "";
    const civico = document.getElementById("civico")?.value.trim() || "";
    const cap = document.getElementById("cap")?.value.trim() || "";
    const prefisso = document.getElementById("prefisso")?.value.trim() || "";
    const numero = document.getElementById("numero")?.value.trim() || "";
    const nick = document.getElementById("nick")?.value.trim() || "";

    // Format data se serve
    const indirizzo = `${via}, ${civico} - ${cap}`;
    const telefono = `${prefisso}${numero}`;
    const dataIT = nascita ? new Date(nascita).toLocaleDateString("it-IT", { day: "2-digit", month: "long", year: "numeric" }) : "";

    // Popola il riepilogo
    document.getElementById("confirm-name").innerText = `${nome} ${cognome}`;
    document.getElementById("confirm-birthdate").innerText = dataIT;
    document.getElementById("confirm-cf").innerText = cf;
    document.getElementById("confirm-address").innerText = indirizzo;
    document.getElementById("confirm-phone").innerText = telefono;
    document.getElementById("confirm-username").innerText = nick;
    document.getElementById("confirm-email").innerText = email;
}
